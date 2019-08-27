Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B22C7E53D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:21:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,436,1559491200"; d="scan'208,217";a="74332965"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2019 15:21:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B5B504CE0881
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:21:06 +0800 (CST)
Received: from localhost.localdomain (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.439.0; Tue, 27 Aug 2019 15:21:14 +0800
From: zang <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <a4df475b-9291-1d3d-43d5-c0c01b8b9806@cn.fujitsu.com>
Date: Tue, 27 Aug 2019 15:20:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: B5B504CE0881.A3F5B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Consultation about the issue of archiver
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
X-List-Received-Date: Tue, 27 Aug 2019 07:21:14 -0000
Content-Type: multipart/alternative;
	boundary="------------6370927E5052F2DF66FC15F6"
Content-Language: en-US

--------------6370927E5052F2DF66FC15F6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

hello:

Recently, when I enabled the archiver.bbclass, I found that some 
packages could not generate the srpm package. The reason is that it 
returned in the function copyleft_should_include() in the file 
archiver.bbclass.

|    included, reason = copyleft_should_include(d)
|    if not included:
|        bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))
|        /*return from here*/
|        return
|    else:
|        bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))

Why do you want to make a license judgment on the package?
I hope someone can answer it, thank you very much.
The following is my local.conf:

| ...
| INHERIT += "archiver"
| ARCHIVER_MODE[srpm] = "1"
| ARCHIVER_MODE[src] = "original"
| ...

e.g. When I use the following 
command,tmp/work/core2-64-poky-linux/openssl/1.1.1c-r0/deploy-sources/ 
is empty.

| bitbake -f -c deploy_archives openssl



--------------6370927E5052F2DF66FC15F6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>hello:</p>
    <p>Recently, when I enabled the archiver.bbclass, I found that some
      packages could not generate the srpm package. The reason is that
      it returned in the function copyleft_should_include() in the file
      archiver.bbclass. <br>
    </p>
    |    included, reason = copyleft_should_include(d)<br>
    |    if not included:<br>
    |        bb.debug(1, 'archiver: %s is excluded: %s' % (pn, reason))<br>
    |        /*return from here*/<br>
    |        return                              <br>
    |    else:<br>
    |        bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
    <p>Why do you want to make a license judgment on the package?<br>
      I hope someone can answer it, thank you very much.<br>
      The following is my local.conf:</p>
    <font size="+2"><span style="color: rgb(29, 28, 29); font-family:
        Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style:
        normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">| ...</span></font><br>
    <font size="+2"><span style="color: rgb(29, 28, 29); font-family:
        Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style:
        normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">| INHERIT += "archiver"</span><span
        style="color: rgb(29, 28, 29); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"></span></font><br>
    <font size="+2"><span style="color: rgb(29, 28, 29); font-family:
        Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style:
        normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">| ARCHIVER_MODE[srpm] = "1"</span></font><br>
    <font size="+2"><span style="color: rgb(29, 28, 29); font-family:
        Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style:
        normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">| ARCHIVER_MODE[src] = "original"</span></font><br>
    <font size="+2"><span style="color: rgb(29, 28, 29); font-family:
        Slack-Lato, appleLogo, sans-serif; font-size: 15px; font-style:
        normal; font-variant-ligatures: common-ligatures;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">| ...<br>
      </span></font>
    <p>e.g. When I use the following
      command,tmp/work/core2-64-poky-linux/openssl/1.1.1c-r0/deploy-sources/
      is empty.</p>
    <span style="color: rgb(29, 28, 29); font-family: Slack-Lato,
      appleLogo, sans-serif; font-size: 15px; font-style: normal;
      font-variant-ligatures: common-ligatures; font-variant-caps:
      normal; font-weight: 400; letter-spacing: normal; orphans: 2;
      text-align: left; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 2; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; background-color: rgb(248, 248,
      248); text-decoration-style: initial; text-decoration-color:
      initial; display: inline !important; float: none;">| bitbake -f -c
      deploy_archives openssl</span>
  </body>
</html>

--------------6370927E5052F2DF66FC15F6--
