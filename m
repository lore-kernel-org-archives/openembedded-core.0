Return-Path: <Rob.Woolley@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2408B73A66
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 17:14:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2AHEaME006088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Mar 2015 10:14:37 -0700 (PDT)
Received: from yow-rwoolley-lx.wrs.com (128.224.20.147) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 10 Mar 2015 10:14:36 -0700
Message-ID: <54FF267B.5000108@windriver.com>
Date: Tue, 10 Mar 2015 13:14:35 -0400
From: Rob Woolley <rob.woolley@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
	<1425945178-14806-3-git-send-email-rob.woolley@windriver.com>
	<CAJTo0LYTFRQVdH9XFcUJ4_CLRoH0Fa8JeDCeKRohe_8zNxwdxA@mail.gmail.com>
In-Reply-To: <CAJTo0LYTFRQVdH9XFcUJ4_CLRoH0Fa8JeDCeKRohe_8zNxwdxA@mail.gmail.com>
X-Originating-IP: [128.224.20.147]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] nfs-utils: Identify CONFFILES
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
X-List-Received-Date: Tue, 10 Mar 2015 17:14:42 -0000
Content-Type: multipart/alternative;
	boundary="------------060200020906030102070408"

--------------060200020906030102070408
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

My understanding is that they are used to help make NFS state-full. The 
"state" file is part of the extension to add Network Status Monitoring 
(NSM) to NFS.

In the RPM world, they need to label them as configuration files to 
avoid them getting overwritten during an upgrade.

The Debian approach removes them on a "purge" in the postrm stage and 
ignore them when doing an "upgrade" in the prerm stage.

So, technically they are not configuration files.  Would another 
approach such as removing them as packaged files and touching the files 
in a postinstall script be preferred?

Regards,
Rob

On 03/10/2015 12:05 PM, Burton, Ross wrote:
>
> On 9 March 2015 at 23:52, Rob Woolley <rob.woolley@windriver.com 
> <mailto:rob.woolley@windriver.com>> wrote:
>
>     +CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab \
>     +                          ${localstatedir}/lib/nfs/rmtab \
>     +                          ${localstatedir}/lib/nfs/xtab \
>     +                          ${localstatedir}/lib/nfs/statd/state \
>     +                          ${sysconfdir}/nfsmount.conf"
>
>
> NFS puts configuration files in /var/lib?  Are files called "state" 
> really configuration files?
>
> Ross


--------------060200020906030102070408
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Ross,<br>
    <br>
    My understanding is that they are used to help make NFS state-full. 
    The "state" file is part of the extension to add Network Status
    Monitoring (NSM) to NFS.<br>
    <br>
    In the RPM world, they need to label them as configuration files to
    avoid them getting overwritten during an upgrade.  <br>
    <br>
    The Debian approach removes them on a "purge" in the postrm stage
    and ignore them when doing an "upgrade" in the prerm stage.<br>
    <br>
    So, technically they are not configuration files.  Would another
    approach such as removing them as packaged files and touching the
    files in a postinstall script be preferred?<br>
    <br>
    Regards,<br>
    Rob<br>
    <br>
    <div class="moz-cite-prefix">On 03/10/2015 12:05 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYTFRQVdH9XFcUJ4_CLRoH0Fa8JeDCeKRohe_8zNxwdxA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 9 March 2015 at 23:52, Rob Woolley
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:rob.woolley@windriver.com" target="_blank">rob.woolley@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":28m" class="a3s" style="overflow:hidden">+CONFFILES_${PN}-client
                += "${localstatedir}/lib/<span class="il">nfs</span>/etab
                \<br>
                +                          ${localstatedir}/lib/<span
                  class="il">nfs</span>/rmtab \<br>
                +                          ${localstatedir}/lib/<span
                  class="il">nfs</span>/xtab \<br>
                +                          ${localstatedir}/lib/<span
                  class="il">nfs</span>/statd/state \<br>
                +                          ${sysconfdir}/nfsmount.conf"</div>
            </blockquote>
          </div>
          <br>
          NFS puts configuration files in /var/lib?  Are files called
          "state" really configuration files?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------060200020906030102070408--
