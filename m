Return-Path: <btv1==97549721fb8==Terry.Boese@vecima.com>
X-Greylist: delayed 695 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Jun 2016 17:01:39 UTC
Received: from mx2.vecima.com (mx2.vecima.com [216.65.182.69])
	by mail.openembedded.org (Postfix) with ESMTP id F29287321C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 17:01:39 +0000 (UTC)
X-ASG-Debug-ID: 1466095802-0359fc4292d9f00001-7zcVdP
Received: from ExchangeInt.corp.vcom.com (exchangeint.corp.vcom.com
	[192.168.50.125]) by mx2.vecima.com with ESMTP id
	Niv82VlBW6TbI3WW for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 10:50:02 -0600 (CST)
X-Barracuda-Envelope-From: Terry.Boese@vecima.com
Received: from [192.168.216.92] (192.168.216.92) by ExchangeInt.corp.vcom.com
	(192.168.50.125) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Thu, 16 Jun 2016 10:50:02 -0600
From: Terry Boese <Terry.Boese@vecima.com>
To: <openembedded-core@lists.openembedded.org>
X-ASG-Orig-Subj: Obtaining a Complete File Manifest for a Given Recipe
Message-ID: <5762D8B9.1000205@vecima.com>
Date: Thu, 16 Jun 2016 10:50:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
X-Originating-IP: [192.168.216.92]
X-Barracuda-Connect: exchangeint.corp.vcom.com[192.168.50.125]
X-Barracuda-Start-Time: 1466095802
X-Barracuda-URL: https://192.168.99.189:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 4200
X-Virus-Scanned: by bsmtpd at vecima.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=4.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.30492
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.00 HTML_MESSAGE           BODY: HTML included in message
Subject: Obtaining a Complete File Manifest for a Given Recipe
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
X-List-Received-Date: Thu, 16 Jun 2016 17:01:41 -0000
Content-Type: multipart/alternative;
	boundary="------------030307070201030204040809"

--------------030307070201030204040809
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

I have a Yocto project which contains multiple modules.  Each module is 
released independently, so I have the problem of trying to identify 
changes in the overall git repository that affect the module being 
released, while pruning the changes that are isolated to the other 
modules.  I could pass an explicit file list to my git log, but at the 
moment I don't know how to get the list of files that affect a given 
recipe.  BBINCLUDED gives me all of the input files for parsing the 
current recipe, but is not recursive to the dependencies, and does not 
provide the list of in-repository files (SRC_URI "file://" entries) that 
can change.  Is there a method currently that will allow me to get the 
file list (or the git history directly)?  If not, what would be the best 
path forward to extend bitbake to add such functionality?

-- 
Terry Boese
Software Developer
Vecima Networks, Inc.
#100, 255 – 2nd Avenue North
Saskatoon, SK S7K 3P2
Phone: (306) 955-7075 x4672
Email: terry.boese@vecima.com

_Notice of Confidentiality:_

This email is intended only for the person or entity to which it is 
addressed,
is confidential and proprietary, and may contain privileged information. Any
disclosure, copying, review, re-transmission, dissemination or other use of,
or taking of any action in reliance upon, this message or any information
contained herein by persons or entities other than the intended recipient is
prohibited and may be unlawful. If you received this message in error, 
please
notify the sender immediately by return electronic transmission and then
delete this transmission, including all attachments, without saving, 
copying,
distributing or disclosing same.

--------------030307070201030204040809
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    I have a Yocto project which contains multiple modules.  Each module
    is released independently, so I have the problem of trying to
    identify changes in the overall git repository that affect the
    module being released, while pruning the changes that are isolated
    to the other modules.  I could pass an explicit file list to my git
    log, but at the moment I don't know how to get the list of files
    that affect a given recipe.  BBINCLUDED gives me all of the input
    files for parsing the current recipe, but is not recursive to the
    dependencies, and does not provide the list of in-repository files
    (SRC_URI <a class="moz-txt-link-rfc2396E" href="file://">"file://"</a> entries) that can change.  Is there a method
    currently that will allow me to get the file list (or the git
    history directly)?  If not, what would be the best path forward to
    extend bitbake to add such functionality?<br>
    <br>
    <div class="moz-signature">-- <br>
      <font size="2" color="gray">
        Terry Boese<br>
        Software Developer<br>
        Vecima Networks, Inc.<br>
        #100, 255 – 2nd Avenue North<br>
        Saskatoon, SK S7K 3P2<br>
        Phone: (306) 955-7075 x4672<br>
        Email: <a class="moz-txt-link-abbreviated" href="mailto:terry.boese@vecima.com">terry.boese@vecima.com</a><br>
        <br>
        <u>Notice of Confidentiality:</u><br>
        <br>
        This email is intended only for the person or entity to which it
        is addressed,<br>
        is confidential and proprietary, and may contain privileged
        information. Any<br>
        disclosure, copying, review, re-transmission, dissemination or
        other use of,<br>
        or taking of any action in reliance upon, this message or any
        information<br>
        contained herein by persons or entities other than the intended
        recipient is<br>
        prohibited and may be unlawful. If you received this message in
        error, please<br>
        notify the sender immediately by return electronic transmission
        and then<br>
        delete this transmission, including all attachments, without
        saving, copying,<br>
        distributing or disclosing same.<br>
      </font>
    </div>
  </body>
</html>

--------------030307070201030204040809--
