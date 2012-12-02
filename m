Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tf5l9-00041z-JO
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Dec 2012 10:22:47 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Dec 2012 01:08:26 -0800
Received: by mail-ea0-f197.google.com with SMTP id d14so1547598eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 01:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=XSSSYe8xI6tlsNysgV/uJFdcSlVHx2WvkAtCqUysCnM=;
	b=TqImd4CETJQuurJgYw4Q2oL3/gDGxJnu1BsPtA+sn4ULRAQng5/VC94FbqQhPtApIs
	o5r2a6jVg1josf3dOMfv9piqjflPr78Li8bnYxXPYxQ//ljq7dS0NIBmdRn0I+ZM27uI
	AZJVxOYnjwHWETge5CjisB1sxtZgp7cR9Jnd0r7t1P55NVWUc14l2SEnq9oJMH3VM9oc
	Yq99wDIDslGAk0m/WWmkaBGgRrku6X6yTipt18WltZ92zfqQ1IHy0/g2/0eeW1hDzlv+
	CMXWJG3d/NWfwMq22idcqS2CnfuNINGytsgP/slPOvCE8te8JlLpMFUHVhiygnTxrntt
	wpFw==
Received: by 10.216.194.170 with SMTP id m42mr2038862wen.30.1354439304204;
	Sun, 02 Dec 2012 01:08:24 -0800 (PST)
Received: by 10.216.194.170 with SMTP id m42mr2038858wen.30.1354439304075;
	Sun, 02 Dec 2012 01:08:24 -0800 (PST)
Received: from [192.168.1.6] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm6951471wib.8.2012.12.02.01.08.21
	(version=SSLv3 cipher=OTHER); Sun, 02 Dec 2012 01:08:22 -0800 (PST)
Date: Sun, 2 Dec 2012 09:08:32 +0000
From: Ross Burton <ross.burton@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <CE66A2F6F8EE4E6D8CA43062C6767D7C@intel.com>
In-Reply-To: <1932884.RUTkbRsFAt@helios>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
	<CAF6bG8fYO6Ent8JqYyfo+oqScYytWqbuYCRh=VyKS=c3zmtqGA@mail.gmail.com>
	<1932884.RUTkbRsFAt@helios>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQldzpAQC9B3F6YS80u3REywOwFAW1i0mRN5JTUsSopD+iy3D715sQDCDEISJTy1FjninSyUjSxKGdx5jipyBCS+i2xQ0ViQr6rxWnIns6ZRPedStSe6skAnCD1d2Z5fBa6O3UVwWPcrJYdsyjrx5mruksv5+J9m3VQyfW4VXewpUh0QfqjB9D6ABSPpeSLRkRGjTTtm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
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
X-List-Received-Date: Sun, 02 Dec 2012 09:22:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 30 November 2012 at 11:38, Paul Eggleton wrote:
> Whoops - turns out I've made this mistake in a number of recipes I submitted
> recently for meta-oe and meta-networking. I can correct those, but if you 
> could fix the OE-Core ones that would be very much appreciated.

I suspect I've made this mistake too. A sanity check of grabbing the LIC_FILES_CHKSUM variable and validating all the fields seems like a good idea, for this and other variables which have a defined set of keys.

Ross 




