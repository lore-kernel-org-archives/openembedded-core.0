Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5013D785AD;
	Sat, 27 Jan 2018 21:44:23 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id v3so1069911plg.3;
	Sat, 27 Jan 2018 13:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=KoxI15wzV5vvOz3OsxB88zxrxhWESy8UlQnyFMBxUTI=;
	b=bshYixr1Lb6V2EqSoWW7EKokQ+uDRynveAcHYFgY8FRryuMbuMqqQ4BkR0m1GGBl5j
	8aIRyms0wTe6OXJNhTZjtvyd+BLAP4aMtjLCwrkquMSLvvtALgdB7aCGeTwZVfkeQWbO
	nsaZRTIFZW5esJT3gp2mbXLxPl8bBberQkkPiMgvKIloHcg6UFiauT2Tvpfj/oax1FU9
	I3TScFdFWnvKihXmxe/qLvTIuOSV3xrgR5gX58DMlQCCESu9EmgSDJYN2d69UudWSGu1
	8uQTluDPIde5qIF4bsTETInoW2lRlNBroc0A4n2OYDMfR3mJW+BGSWOKVryXzGHAB715
	3pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=KoxI15wzV5vvOz3OsxB88zxrxhWESy8UlQnyFMBxUTI=;
	b=pJUACvUm3R6nGGIN6DWMEc0D+uMylE97dQ/kpAovC5bENBMbV4on+wcg96zciWVWKe
	PS/hcmttTbL966CdxgNtqk+RNHpmHj0kPdT6R/BLwNAAjGGNjIdGApGyElKPV72KOejE
	rEHyAdEd9UQjCcNAlEIyiFZiqcWcI5UbjhVr2BgQeKH5NUYCyRAyNkpug/GiRQ7fN65c
	kLA3OV53K0MGjaAWOf2Zzi2SkcfZ0Vzszl/XapD6QHcCAowqxabKLFWKKhSPlPT5Vbph
	16Ghll4Yf1lgV4aeqTouh8OVkm2JcI9qM0U8Sp4ceysRpKEOdYTIYkAn8S8ARYN41hQi
	Ha1A==
X-Gm-Message-State: AKwxyteugYBLCJKZpKMjQh2xszFvQSkgwIp1k9JYixw8AuAIrcEUYlY/
	Tjd7e8lWzmmEpmz++j4IvrU=
X-Google-Smtp-Source: AH8x225Vk0hQbpThV9fhlI+YGKYCiI7LQqqSdiQsCwxtmEoXRz2ESUjJaGJzoUrr32qhOw1vj1qIjA==
X-Received: by 2002:a17:902:8498:: with SMTP id
	c24-v6mr17551519plo.450.1517089465474; 
	Sat, 27 Jan 2018 13:44:25 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:8cc2:eed3:a043:ef2a])
	by smtp.gmail.com with ESMTPSA id d4sm6036716pgc.58.2018.01.27.13.44.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jan 2018 13:44:24 -0800 (PST)
To: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <45db0f72-d93f-ebbd-83aa-80ceaeabc083@gmail.com>
Date: Sat, 27 Jan 2018 13:44:23 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
Subject: [RFT] Glibc 2.27
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
X-List-Received-Date: Sat, 27 Jan 2018 21:44:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi All

glibc 2.27 is releasing soon in few weeks. I have put together the 
recipes for upgrade, along with fixes for some of packages that I ran 
into here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/glibc-2.27

This has gotten limited testing. I plan to put the package fixes as we 
plough through. Please test this out in your setups and report problems 
or fixes ( preferred ) to get various packages working on 2.27 release

Thanks
-Khem

