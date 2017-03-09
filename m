Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBFA719C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 07:03:50 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id z15so2104318lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 23:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Rop9kAfscqDGOWP+2DPLiRhmDbstCOk8wk4X6Rf9jX4=;
	b=pr2IHBWc8VognJYn1l9MxOo0+/vNMy5SzujpHkg/MJSBdL7TT3dsSJxQ3MT+vRIrjQ
	U6wBN26+G01hhrPNd/u2qYs+4TRj3QYShWe/r9WoPmgKKsuqDSKKo1cvbC3zCKWHqd/l
	ym7gPnzIFVKtWA+9xGkUrQYFqbUYp5eW2984yWNJ3ZfG/o2918s42GN1foF2RyiFEHKo
	NViW7BR/VTFUiqYk6nEMItRm+AnRlZ8/pjC1GdUdBWtzCxs1VBvtwKampnEEameFvgoE
	6RX1/DcObCwuFFRGykafjnMdR0QNWMFtLBFZ3Lk8Omk7lXuIs91Ki/vMpsxbmFv67Q4l
	k7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Rop9kAfscqDGOWP+2DPLiRhmDbstCOk8wk4X6Rf9jX4=;
	b=gxaUdkTBv5Z2xfccBLMkJesoVAV2JhO+l376GQ17VL/0Cc5HLMRAirDL5eLfycyzzT
	d+/CxL6j2ZHBenuRdW3qW2QPXg3jxAYWB1n1B9vunJ8Q6AssILv3Ao57AHajAv0+TgaW
	FDMZbzdNfCMZEYhcSY+VcVhixvnFPPAIKPr4NpbEwAJRounsGP6Qan7tvQuJ9/v2uXBm
	NQHDhFWCXgblbqH6g3MMDPGeli55zFLecRVme+SUmMBmfrh9cuTdfL/0eKA+raj5nZvu
	4rciXdoTzCcpplymwdZ8A9VyUhZZrsfpsITEOXOs2rcJY3pqbOL3F7eIw2J6TmbFQ0xH
	KohQ==
X-Gm-Message-State: AMke39k+RbaVOoas1tdTm647/t26kUGu6bu8QSXtvBeiJWqIjzPWohEc3lLPOpUbxok20w==
X-Received: by 10.46.33.141 with SMTP id h13mr3375237lji.135.1489043031306;
	Wed, 08 Mar 2017 23:03:51 -0800 (PST)
Received: from [10.20.41.60] ([77.88.92.6])
	by smtp.googlemail.com with ESMTPSA id
	3sm1080311ljj.16.2017.03.08.23.03.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 23:03:50 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Matt Madison <matt@madison.systems>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
	<20170308221933.GA8506@haswell>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <a1284fc5-f4e3-75a9-6832-893fedef7b30@mender.io>
Date: Thu, 9 Mar 2017 08:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170308221933.GA8506@haswell>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Thu, 09 Mar 2017 07:03:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 08/03/17 23:19, Khem Raj wrote:
>> ...
>> For the following go-1.4 recipes:
>>
>> I wouldn't recommend fixing go-native at version 1.4, which is now
>> postiviely ancient.
>> Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
>> in the right place so
>> that make.bash finds it.  This way, you can have all the go toolchain
>> recipes build at the
>> same version.  The go team only supports go1.4 for bootstrapping the
>> compiler build now
>> anyway, IIRC.
> 
> since we do not use go-native for anything other than bootstrapping
> right now, thats why it is there. there is no intent of providing a
> go-native version for general consumption

Just FYI, in Mender we use the latest go-native, provided by
github.com/mem/oe-meta-go, to compile some build tools. The layer has a
separate go-bootstrap recipe, which is locked to 1.4, for the purpose of
creating go-native and go-cross.

-- 
Kristian

