Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1SATId-0002RJ-Oo
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:42:31 +0100
Received: by dado14 with SMTP id o14so2035635dad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=4pu6WGLZ8Pxbe4jR/cVPBXGkHrPdAT/FneRG+OLvSW8=;
	b=lthfunkhFB3CPAXDkLY2BcaVg3Dxep4YwarmvG3oXx1MfJojqQo+iDtLs/exaldmY7
	uZ6E30ahqUzxk/IuLstH6lslthlorX8s81P326V23BKfztdJFIXEDb4lzzhddeuNqifJ
	s9Gd44Z+HJQYoqSKrnwvYe2MfKih+oLw9lJlYRggouXMRWKLpefUGD9NxtcsmHu3lJW9
	/wTkcN1t8EidLFbiLt2ZVnu45QvTLheKhPGw8RsHZJ/WtbQHWAScUsmVl/yg2WBAjTx2
	3VjkEPh1kzdxVJ0cVT53x7FeMTVEUo0G0r1cUksVyqD++iaoBvHnkwdMOemmJswaKKNK
	c3Jg==
Received: by 10.68.220.129 with SMTP id pw1mr14812925pbc.27.1332365616609;
	Wed, 21 Mar 2012 14:33:36 -0700 (PDT)
Received: from [192.168.1.4] (c-76-20-107-156.hsd1.ca.comcast.net.
	[76.20.107.156])
	by mx.google.com with ESMTPS id o7sm2185568pbq.8.2012.03.21.14.33.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:33:34 -0700 (PDT)
Message-ID: <4F6A491F.40400@mvista.com>
Date: Wed, 21 Mar 2012 14:33:19 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F6948EC.5050309@windriver.com> <333082295.tACmPZfEAB@helios>
	<4F699E6C.6070306@windriver.com>
In-Reply-To: <4F699E6C.6070306@windriver.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQk3afJw5CGHkt8wu0Tq0KyzibzmY2d1u42okVrcrXRJNDQ60MoVrITzyLQxWdRdiKJuzGhD
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: runqemu doesn't work with graphics through ssh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 21:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> It doesnt' work for me since a long time ago, maybe 3 months ago, I doubted
> this was because of my host(Ubuntu 11.10 64bit), but it still didn't work
> when I changed to FC 13 64bit.
> 
> I tried another host Ubuntu 10.10 32bit just now, this one worked well.


I have also run this on a FC 14 back to a windows machine running the
cygwin Xwin and it seems to work fine for me.

-- 
Jeremy Puhlman
Montavista Software, LLC.


