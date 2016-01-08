Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31ED6731D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 08:44:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u088iYFh029095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 8 Jan 2016 00:44:34 -0800
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 8 Jan 2016 00:44:34 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
	<1452137394-333-4-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <568F76EF.20009@windriver.com>
Date: Fri, 8 Jan 2016 16:44:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Jan 2016 08:44:36 -0000
Content-Type: multipart/alternative;
	boundary="------------000908040308010007070206"

--------------000908040308010007070206
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2016年01月07日 20:21, Burton, Ross 写道:
>
> On 7 January 2016 at 03:29, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     Sometimes the grep output is not correct if the log message contains
>     some special characters. Use re.escape to escape all non-alphanumerics
>     before grep
>
>
> If we're going to insist that the strings are literal then instead of 
> telling grep to use extended regexp's and passing escaped regexs, why 
> not just use -F which tells grep to search for fixed strings, not 
> expressions.
Hi Ross,

It still need to escape quotation marks if using -F option.
Consider the following log:
[521514.737] (EE) evdev: Qemu Tablet: Unable to open evdev device 
"/dev/input/touchscreen0".

We still need an extra step to replace " with \" before grep

Yi

>
> Ross


--------------000908040308010007070206
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">在 2016年01月07日 20:21, Burton, Ross 写道:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 7 January 2016 at 03:29, Yi Zhao <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:yi.zhao@windriver.com" target="_blank">yi.zhao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":16b" class="a3s" style="overflow:hidden">Sometimes
                the grep output is not correct if the log message
                contains<br>
                some special characters. Use re.escape to escape all
                non-alphanumerics<br>
                before grep<br>
              </div>
            </blockquote>
          </div>
          <br>
          If we're going to insist that the strings are literal then
          instead of telling grep to use extended regexp's and passing
          escaped regexs, why not just use -F which tells grep to search
          for fixed strings, not expressions.</div>
      </div>
    </blockquote>
    Hi Ross,<br>
    <br>
    It still need to escape quotation marks if using -F option. <br>
    Consider the following log:<br>
    [521514.737] (EE) evdev: Qemu Tablet: Unable to open evdev device
    "/dev/input/touchscreen0".<br>
    <br>
    We still need an extra step to replace " with \" before grep<br>
    <br>
    Yi<br>
     <br>
    <blockquote
cite="mid:CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000908040308010007070206--
