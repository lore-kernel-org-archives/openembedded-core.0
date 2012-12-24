Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tn4L8-0007GY-GK
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 10:28:54 +0100
Received: from mail-wg0-f72.google.com ([74.125.82.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 24 Dec 2012 01:14:03 -0800
Received: by mail-wg0-f72.google.com with SMTP id fg15so5629562wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2012 01:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=5CpwkmCcr1w0NUcoKsd5ehFu10LwFjKfefM3NWUNbXU=;
	b=mFrMN33awve5gwDttYHi9GiidJ+sAtGue9nX7UqALWmHZrPuzCi2UnKRjnib4NkLcv
	rBGVp0uMsfV9XNz6UXpNY+B0zZYnzO3gUV7C0xaQMfCgrXzkVPxeVep8NH/sk/rldhef
	jT7E87KPcusHyVV+qBrNiNYca+ZyZwZMTy4edqhDQ4G+IIWpSqUDzh0zk7fhOyO5VDD7
	k2zLNmtTXBQdwnsfiTOAD9BJbNKANFPrRhKl32pqXrqZvQvJsta9pXa5Ux1ZYTNblcdE
	eR5WJAslbGdrz+xM79mkjlVY6zcXlM3EMhNUQ+QJwwfqpxNBBcVUZna7BGfMYkz/kw6z
	VMQA==
X-Received: by 10.194.123.105 with SMTP id lz9mr34683313wjb.43.1356340380805; 
	Mon, 24 Dec 2012 01:13:00 -0800 (PST)
X-Received: by 10.194.123.105 with SMTP id lz9mr34683311wjb.43.1356340380755; 
	Mon, 24 Dec 2012 01:13:00 -0800 (PST)
Received: from [192.168.1.13] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm32177557wiv.6.2012.12.24.01.12.58
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2012 01:12:59 -0800 (PST)
Date: Mon, 24 Dec 2012 09:13:01 +0000
From: Ross Burton <ross.burton@intel.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <2A6636D5170440C9924CFC01BDED831A@intel.com>
In-Reply-To: <1d67932d2878800a0b033b6d2349e179df566d97.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
	<1d67932d2878800a0b033b6d2349e179df566d97.1356337650.git.constantinx.musca@intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmaLLrhey/iJ/mSxIb7866bs/0Vo/w6b9OJsN4XEEIcuSpDtldNuTw5E9IC7P4j6cvHA0KIMpXSEsUkUQ2Amw4B69FosYik5IdVeW4Fov+f5gUHxvW08tH20XolHQ/sEA5YPhQlI9iQQS0E/rMcwuCP73MSfQGTGEijbReUUT0f4EmmALEHlkULzXrhGMzBFAhKJEjE
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/15] libcroco: upgrade to 0.6.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 09:28:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday, 24 December 2012 at 08:34, Constantin Musca wrote:
> License checksum modification due to:
> src/cr-rgb.c: code (not license) change

Can the checksum be moved to another file, or changed so that it only checksums the license itself? 

Ross


