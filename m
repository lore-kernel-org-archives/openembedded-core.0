Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2412A6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 02:23:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL2NlvS003606
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Nov 2014 18:23:48 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 20 Nov 2014 18:23:47 -0800
Message-ID: <546EA236.8010502@windriver.com>
Date: Fri, 21 Nov 2014 10:23:50 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>	<1415958217-16545-2-git-send-email-jian.liu@windriver.com>
	<CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com>
In-Reply-To: <CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 1/5] base-files: files will be over written when updating using rpm
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
X-List-Received-Date: Fri, 21 Nov 2014 02:23:53 -0000
Content-Type: multipart/alternative;
	boundary="------------050609040603010509050502"

--------------050609040603010509050502
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2014 04:37 AM, Burton, Ross wrote:
>
> On 14 November 2014 09:43, Jian Liu <jian.liu@windriver.com 
> <mailto:jian.liu@windriver.com>> wrote:
>
>     +CONFFILES_${PN} += "${sysconfdir}/motd
>     ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
>
>
> I do have to wonder why we don't allow globs in CONFFILES and set 
> CONFFILES_${PN} to ${sysconfdir} by default...
>
> Ross
>
>
>

Hi Ross,

There's a related bug on bugzilla.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5200

I sent out a patch some time ago about this problem. The patch titile is 
"[OE-core] [PATCH 0/2] Change the way of handling CONFFILES".

I think setting CONFFILES to be ${sysconfdir} and allowing overriding 
might be better than listing each file in CONFFILES in each individual 
recipe.

There's more information in the comment of the bug. If you agree with 
this solution, I can rebase the patch and send out V2.

What do you think?

Best Regards,
Chen Qi


--------------050609040603010509050502
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 11/21/2014 04:37 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaTqjSJ35Lq4hbTDeF0F0Y2iAbdUU4+1VE11mhKoGZrgg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 14 November 2014 09:43, Jian Liu <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:jian.liu@windriver.com" target="_blank">jian.liu@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":50s" class="a3s" style="overflow:hidden">+CONFFILES_${PN}
                += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf
                ${sysconfdir}/profile"</div>
            </blockquote>
            <div><br>
            </div>
            <div>I do have to wonder why we don't allow globs in
              CONFFILES and set CONFFILES_${PN} to ${sysconfdir} by
              default...</div>
            <div><br>
            </div>
            <div>Ross</div>
          </div>
          <br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    There's a related bug on bugzilla.<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=5200">https://bugzilla.yoctoproject.org/show_bug.cgi?id=5200</a><br>
    <br>
    I sent out a patch some time ago about this problem. The patch
    titile is "[OE-core] [PATCH 0/2] Change the way of handling
    CONFFILES".<br>
    <br>
    I think setting CONFFILES to be ${sysconfdir} and allowing
    overriding might be better than listing each file in CONFFILES in
    each individual recipe.<br>
    <br>
    There's more information in the comment of the bug. If you agree
    with this solution, I can rebase the patch and send out V2.<br>
    <br>
    What do you think?<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
  </body>
</html>

--------------050609040603010509050502--
