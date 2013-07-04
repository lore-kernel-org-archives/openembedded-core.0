Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id B688C6077F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 18:49:19 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so1309553pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 11:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=uDuKsPPfq2A/Mk1RvhqaeJioYplaYQQTV34pdlsgOX4=;
	b=TRagUcyXl0vZbH/t/ZzMcvAGW45f9K435B9Wx146ttgI3Yr0PyWkzkHJwIRzDAG7Vc
	2S0vubKc+CFajCiyAkmY4+Ik5zahYr1Bylus7VmNRa3TFdnjToPCHsZFysMNCw8E5jpX
	Fy1jSXzK35w4kULFm5SQMybluYFGP3XreUwC8TJzXvs7RK9Rlt9+rynU7j88dpLcv39Z
	tJsdMj2qf/wWH6UGMgTlVunVqWmbfl7wAXnOr6zzgjb5Mo77X3DwVUDOyj3l/0gM0Q2a
	WFS720uTGJPQBtMWhzg5t9AbUwYyveZRHBkHgIDheiT9cDhovD/N6UbA3Q6J0tTKoks7
	hHNA==
X-Received: by 10.68.252.233 with SMTP id zv9mr6582640pbc.69.1372963760688;
	Thu, 04 Jul 2013 11:49:20 -0700 (PDT)
Received: from [172.23.5.122] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id gb2sm2706403pbd.28.2013.07.04.11.49.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 11:49:19 -0700 (PDT)
Message-ID: <51D5C3A7.4010803@gmail.com>
Date: Thu, 04 Jul 2013 11:49:11 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1372947733.git.radu.moisan@intel.com>
	<84abd44bc70ed4b13ca44a8ad32a8a91d708163b.1372947733.git.radu.moisan@intel.com>
In-Reply-To: <84abd44bc70ed4b13ca44a8ad32a8a91d708163b.1372947733.git.radu.moisan@intel.com>
Subject: Re: [PATCH 01/11] iputils: Upgrade to v20121221
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
X-List-Received-Date: Thu, 04 Jul 2013 18:49:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/04/2013 07:57 AM, Radu Moisan wrote:
> Replaced openssl with gnutls in dependency list

why is this done ?

