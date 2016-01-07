Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2F06FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:00:33 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 1so209636568ion.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=H1ez+u2/yGDb/1VGU545MOrm85tl+e8IydiivUbSTDg=;
	b=WnLgGOs2JJSBzD8qx3t4rQXJjRJm42z062pqnrrrm0MnxxxlAAzzZJpX1F4UHKCzwA
	uBIickYHaV66NMRu5+sE57zN1C4uPVrvxsEKpdkA5yb3w5NtC+naMvPUjckan2KSb9HB
	4wLkbeU05BnS6etCSUsI0oAd4FS6+T3n4vo9DvfQzoYDBeB+zpUPkd4pYeftgKScByEJ
	5HoiCdaHcJdXsIfRpCmwJnf1+o+lbp1KzoqHQE42Jw/Ld5LC4eg856YVS7Jwv3xPU+8H
	sodRqgq657H7BkxQYE1tGInBLSUPHtC49urTqcB8aNRZRN4P077xGlHIoPvlo1orY4zq
	eXXQ==
X-Received: by 10.107.15.17 with SMTP id x17mr95217507ioi.35.1452182434747;
	Thu, 07 Jan 2016 08:00:34 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	j10sm5050920igx.15.2016.01.07.08.00.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 08:00:34 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1452096306.git.ross.burton@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568E8B9F.1040700@gmail.com>
Date: Thu, 7 Jan 2016 11:00:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1452096306.git.ross.burton@intel.com>
Subject: Re: [PATCH 00/63] Consolidated pull
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
X-List-Received-Date: Thu, 07 Jan 2016 16:00:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

With this applied bitbake can't parse meta-openembedded because

meta-openembedded/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb:25:
Could not inherit file classes/qmake2.bbclass

unless the user adds git://git.yoctoproject.org/meta-qt4 to their layers.

Should this recipe be also moved to meta-qt4?

