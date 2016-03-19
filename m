Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E125E6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 09:09:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2J99UCi029325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 19 Mar 2016 02:09:30 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 19 Mar 2016 02:09:29 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
	<ced58b296b886bfe1db833e823eb2b80d43e324f.1458282563.git.hongxu.jia@windriver.com>
	<CAJTo0LZOnFNpsyDe3NRZjY6Tygb_uHSK=+hdGTJFEnOHN-DJyQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <56ED1745.2070306@windriver.com>
Date: Sat, 19 Mar 2016 17:09:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZOnFNpsyDe3NRZjY6Tygb_uHSK=+hdGTJFEnOHN-DJyQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/18] gconf: fix buildpaths QA issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Mar 2016 09:09:34 -0000
Content-Type: multipart/alternative;
	boundary="------------020504060005070109080409"

--------------020504060005070109080409
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2016 12:28 AM, Burton, Ross wrote:
>
> On 18 March 2016 at 09:01, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     In ${S}/gconf/gconfd.c, we have:
>     ...
>       /* -- Debug only */
>
>       if (addresses == NULL)
>         {
>           gconf_log(GCL_DEBUG, _("gconfd compiled with debugging;
>     trying to load gconf.path from the source directory"));
>           conffile = g_strconcat(GCONF_SRCDIR, "/gconf/gconf.path", NULL);
>           addresses = gconf_load_source_path(conffile, NULL);
>           g_free(conffile);
>         }
>
>       /* -- End of Debug Only */
>
>
> This seems like a lot of effort to remove a build path from the 
> binaries.  Can we just disable the debugging support instead?  GConf 
> is effectively unmaintained these days anyway.
>

Of course yes, I will update it to disable debug support

//Hongxu

> Ross


--------------020504060005070109080409
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/19/2016 12:28 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZOnFNpsyDe3NRZjY6Tygb_uHSK=+hdGTJFEnOHN-DJyQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 18 March 2016 at 09:01, Hongxu Jia
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:hongxu.jia@windriver.com" target="_blank">hongxu.jia@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":93e" class="a3s" style="overflow:hidden">In
                ${S}/gconf/gconfd.c, we have:<br>
                ...<br>
                  /* -- Debug only */<br>
                <br>
                  if (addresses == NULL)<br>
                    {<br>
                      gconf_log(GCL_DEBUG, _("gconfd compiled with
                debugging; trying to load gconf.path from the source
                directory"));<br>
                      conffile = g_strconcat(GCONF_SRCDIR,
                "/gconf/gconf.path", NULL);<br>
                      addresses = gconf_load_source_path(conffile,
                NULL);<br>
                      g_free(conffile);<br>
                    }<br>
                <br>
                  /* -- End of Debug Only */</div>
            </blockquote>
          </div>
          <br>
          This seems like a lot of effort to remove a build path from
          the binaries.  Can we just disable the debugging support
          instead?  GConf is effectively unmaintained these days anyway.</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    Of course yes, I will update it to disable debug support<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZOnFNpsyDe3NRZjY6Tygb_uHSK=+hdGTJFEnOHN-DJyQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020504060005070109080409--
