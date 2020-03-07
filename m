Return-Path: <adrian.fiergolski@fastree3d.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8E04760C6D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 22:07:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id v11so6465047wrm.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 14:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-language;
	bh=UjK9ZPU3Zy7IDYMI5VJn9QsYSZpMYNozdF5GRf30auU=;
	b=vpD99kWXQInfSzOrLG07gGfmFdPdcyvfs46nydshhNkNbJouCMms7lbPQhcEV+L45T
	McZyKpzXjeQ9kDGUyAou01SEemNS3BBEj2/VdK9er5TfLzaOngCdBb3cjsNsEMs3UohD
	CBhj9TU5jXzdVdBWPthytmJuOHLox5VxVrr013h9baLMo1NPuyioBQeHIASHO20IMNXL
	84FYrVqA1k7iCDGObz47mcr2mXEX+Nux4636ixDjyEB6jKwfGF+l/ZH1Dek1BfaMK8ZO
	Tn9Fg85GMSJnjv4M2ipmByka/gFYjjWIA2HDgHcEiYHCH7pVN21JBplwW+2feymKQbo0
	cWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-language;
	bh=UjK9ZPU3Zy7IDYMI5VJn9QsYSZpMYNozdF5GRf30auU=;
	b=RA2dqpRvb8Xmh4r5P+CpFbDoNShc1eGuOVohNsKTpybdFkzrgd1Q2aujRa4piMLlON
	rRPpy+9gdum4u7slAtbhXt3evVwq/mRKQnffHY3knOwAJUpe693Q+JWCjtiexE00KtXb
	xviTKU77ejdf+7noo9vJeMHwKPs4+ewR6SZGeF7Vo3CmASF0HlQrww8XRhVzXlizLaSi
	vUiT75uwtUVEZTPDaa+qf3lXCwm8YEiyIAihbgdU2Guk9k1S9xBwaqTmDXs7wlwZeQIp
	tprnGBfki2eyBodL50aw0oa8IVgxUISV6GK6I+pyJoTyX3EZPSZPWFx5JFfTQhFo1fT2
	ZwuQ==
X-Gm-Message-State: ANhLgQ03GNgKo//hXenr2cFQeeN3LMlN4Wm7iRBWLH35xBTerD8IxSz1
	d6FySZNC/q1dZArrrBs9TVsmYMyL1w==
X-Google-Smtp-Source: ADFU+vvDH4G4E5tiG5cDKuzEn9rmi3YaLodsYfJUTfq9tcNwhwOIUa6H82vVMa2jkzIg84ZtyWBZWg==
X-Received: by 2002:adf:a2d9:: with SMTP id t25mr11075221wra.84.1583618826812; 
	Sat, 07 Mar 2020 14:07:06 -0800 (PST)
Received: from [192.168.2.135]
	(185.234.197.178.dynamic.wless.lssmb00p-cgnat.res.cust.swisscom.ch.
	[178.197.234.185]) by smtp.gmail.com with ESMTPSA id
	n3sm18649333wmc.42.2020.03.07.14.07.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 07 Mar 2020 14:07:06 -0800 (PST)
From: Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <79087be9-c34e-8e27-5b0f-e7b21d03f89f@fastree3d.com>
Date: Sat, 7 Mar 2020 23:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
Subject: [opencv] debugging
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
X-List-Received-Date: Sat, 07 Mar 2020 22:07:06 -0000
Content-Type: multipart/alternative;
	boundary="------------90805D8147F43933198C9E15"
Content-Language: en-GB

--------------90805D8147F43933198C9E15
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

I would like to build /opencv/ with debug symbols and with possible
minimum optimization (I need to debug it). In the /opencv/ recipe I
haven't found any PACKAGECONFIG related to debugging. I have tried to add

    /EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Debug" /

in the recipe but it gives the error:

    ninja: error: 'TBB_ENV_LIB_DEBUG-NOTFOUND', needed by
    'lib/libopencv_core.so.4.1.0', missing and no known rule to make it

Has anyone tried to build /opencv/ in debug mode and could share how it
was achieved?

Regards,

Adrian Fiergolski


--------------90805D8147F43933198C9E15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>I would like to build <i>opencv</i> with debug symbols and with
      possible minimum optimization (I need to debug it). In the <i>opencv</i>
      recipe I haven't found any PACKAGECONFIG related to debugging. I
      have tried to add</p>
    <blockquote>
      <p><i>EXTRA_OECMAKE_append = " -DCMAKE_BUILD_TYPE=Debug" </i><br>
      </p>
    </blockquote>
    <p>in the recipe but it gives the error:</p>
    <blockquote>
      <p>ninja: error: 'TBB_ENV_LIB_DEBUG-NOTFOUND', needed by
        'lib/libopencv_core.so.4.1.0', missing and no known rule to make
        it</p>
    </blockquote>
    <p>Has anyone tried to build <i>opencv</i> in debug mode and could
      share how it was achieved?</p>
    <p>Regards,</p>
    <p>Adrian Fiergolski<br>
    </p>
  </body>
</html>

--------------90805D8147F43933198C9E15--
