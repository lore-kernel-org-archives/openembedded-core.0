Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 940FE60017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 01:51:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0C1pIVm008569
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jan 2016 17:51:18 -0800 (PST)
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 11 Jan 2016 17:51:17 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
	<1452137394-333-4-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com>
	<568F76EF.20009@windriver.com>
	<CAJTo0LYvLxSBXZ5VWzVrKzSww7xQgpX=L2_dc=ZxOOkCpzX+vA@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <56945C12.7020507@windriver.com>
Date: Tue, 12 Jan 2016 09:51:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYvLxSBXZ5VWzVrKzSww7xQgpX=L2_dc=ZxOOkCpzX+vA@mail.gmail.com>
X-Originating-IP: [128.224.162.175]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oeqa/runtime/parselogs: escape special character for grep
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
X-List-Received-Date: Tue, 12 Jan 2016 01:51:18 -0000
Content-Type: multipart/alternative;
	boundary="------------030205030206090307020208"

--------------030205030206090307020208
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年01月08日 16:59, Burton, Ross 写道:
>
> On 8 January 2016 at 08:44, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     It still need to escape quotation marks if using -F option.
>     Consider the following log:
>     [521514.737] (EE) evdev: Qemu Tablet: Unable to open evdev device
>     "/dev/input/touchscreen0".
>
>     We still need an extra step to replace " with \" before grep
>
>
> Actually that's only true as the grep command is passed to 
> subproces.check_output() as a string.  If it was constructed as a list 
> the shell wouldn't be parsing it and you wouldn't have to worry about 
> quoting at all.
>
> (always pass lists instead of strings to subprocess, it makes 
> everything a lot easier)
>
> Ross

Thanks, Ross.

I will test it and send the v2 patch.

Yi

--------------030205030206090307020208
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">在 2016年01月08日 16:59, Burton, Ross 写道:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYvLxSBXZ5VWzVrKzSww7xQgpX=L2_dc=ZxOOkCpzX+vA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 8 January 2016 at 08:44, Yi Zhao <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:yi.zhao@windriver.com" target="_blank">yi.zhao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div bgcolor="#FFFFFF" text="#000000">It still need to
                escape quotation marks if using -F option. <br>
                Consider the following log:<br>
                [521514.737] (EE) evdev: Qemu Tablet: Unable to open
                evdev device "/dev/input/touchscreen0".<br>
                <br>
                We still need an extra step to replace " with \" before
                grep</div>
            </blockquote>
          </div>
          <br>
          Actually that's only true as the grep command is passed to
          subproces.check_output() as a string.  If it was constructed
          as a list the shell wouldn't be parsing it and you wouldn't
          have to worry about quoting at all.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">(always pass lists instead of strings
          to subprocess, it makes everything a lot easier)</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Thanks, Ross.<br>
    <br>
    I will test it and send the v2 patch.<br>
    <br>
    Yi<br>
  </body>
</html>

--------------030205030206090307020208--
