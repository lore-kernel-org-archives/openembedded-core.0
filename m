Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UXIbI-0007NN-Nv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 00:00:41 +0200
Received: by mail-pb0-f52.google.com with SMTP id mc17so463035pbc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 14:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=sOwpYW3s7DouYg4tdYVQ1ql+nN9nzyRsKV2qHsXoqcw=;
	b=HaDB46Vg1cZr87Q2J+AIDmFmzxlBk6M8z+E7CJL4p/lcjA6P/btil8GRnkYAYZe5tD
	+w6EGzEaU6zgJLVPGCQt9l+50q9txFWqpx+WE+KFoXsHa65GXWxD0F+S0rUhhztUoFzg
	vcZlSKPv6FyHBc910b4xlZzeR5DRd+oGceePDffKx66FyZ+V3DxCAGwCLEvpghdjichp
	xGJ+RQK9IhQVibjAvN7nlZDBDYnl3KYRd9D/rokxP1wx7G3OnEZbPdvzr/2so82I06dw
	37gAr1PZYmVENzR5DJC4pnxxBrr+pTgKr++XjyqDBIrFWmBHh6t82jjUDr2tMrHjxsBj
	3CcA==
X-Received: by 10.66.4.106 with SMTP id j10mr944714paj.218.1367358168937;
	Tue, 30 Apr 2013 14:42:48 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id w8sm178761pbo.9.2013.04.30.14.42.47
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 14:42:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <c4a83801dc67074b524dd33c56ba9eed819def6f.1367340369.git.paul.eggleton@linux.intel.com>
Date: Tue, 30 Apr 2013 14:42:46 -0700
Message-Id: <91BED47F-18E9-4E12-AED1-0137D93E9251@gmail.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
	<c4a83801dc67074b524dd33c56ba9eed819def6f.1367340369.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] bitbake.conf: set SERIAL_CONSOLES from SERIAL_CONSOLE by default
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
X-List-Received-Date: Tue, 30 Apr 2013 22:00:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 30, 2013, at 9:52 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> This is the first step in deprecating SERIAL_CONSOLE without affecting
> machine configurations that still use it.

Did you mean deprecating SERIAL_CONSOLES or SERIAL_CONSOLE=


