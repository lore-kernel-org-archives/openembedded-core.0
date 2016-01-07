Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2FB731E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 05:21:17 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q21so241099528iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 21:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=lFQA7QNy+6jQwAy6T2RXZLScEQ8yA60B676LKZ3SuEc=;
	b=MeI0WTavshRlIX5bYTCte90r47t1wqqKVecYpnkoOXwbnxhJBPjQ50tivE7HxUZH1P
	M3IA1VRoU48U0rIoBvNJk2WjqeXrmQJyWwHQbS8E/eEL8HHmz06oKmnDQSzypE/YerPP
	QJSgcKIEAY2t5Sub9w7KlVHw6OG26PF0Dbe0vRzj4el18YifN7QuBH6d46laCUUgBjl1
	Ap2t1oxSoeMA1tvD2na3maXDv8moVFzrOqUiKraC/GhjUuDR3oo9KCm1ct1SlsAZI+yj
	/FK/llKH4oXxUbuFclKGA1MTa0INNMqUD6exS3JgQDdP3Sc7RKUCUBX7JF5B+pcPtgfQ
	/2/Q==
X-Received: by 10.107.10.170 with SMTP id 42mr88187818iok.64.1452144077651;
	Wed, 06 Jan 2016 21:21:17 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	x4sm4278205igw.12.2016.01.06.21.21.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 21:21:17 -0800 (PST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568DF5C6.90509@gmail.com>
Date: Thu, 7 Jan 2016 00:21:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: invoking a native compiler (gcc)
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
X-List-Received-Date: Thu, 07 Jan 2016 05:21:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

If a recipe needs to build some tool on the build machine which it later
wants to invoke, my understanding is that BUILD_CC should be used?

