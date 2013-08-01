Return-Path: <sledz@dresearch-fe.de>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 10A5C6B3A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:52:57 +0000 (UTC)
Received: by mail-bk0-f42.google.com with SMTP id jk14so618583bkc.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=zP8kVwyNKlaCdrhEgExrmiSMix8pPvKSenjQr3ecHYU=;
	b=Cp7fvF9fgffTbXmChI7gPigGq8v00b4q5EV/vRZz/GaBaBw8+lhrUygXL7vFg35LkU
	ARVAlE9CaCxz4nNi5GU5T+d1Q/CrjEb/3dHdbLwW5mDcvNJmqnzXNWf5iOvTfqtQrwsK
	AmGSkV0cTCd6sKVPAwUNAgB68Az5bFaYUzGMCDMSU6ldLj0FDnsQjL9tk/c9kPQ+HhJf
	e2bJT5Z9Y+gSZTotQd9vo+rQps0OIiRsIGtkQgtk6jwUItJ8uhUOsh/ySsCpQ+ZEWZ3r
	V3gSWGFkq7NiDbkQN9v4E6Se7vWM+EJ6d6UKCNGsyzB3ubsFyTmjIVrW6hgH+zHEcJbw
	Qx9A==
X-Received: by 10.204.188.134 with SMTP id da6mr241490bkb.49.1375354377308;
	Thu, 01 Aug 2013 03:52:57 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPSA id m6sm504511bki.7.2013.08.01.03.52.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 03:52:56 -0700 (PDT)
Message-ID: <51FA3E05.2070205@dresearch-fe.de>
Date: Thu, 01 Aug 2013 12:52:53 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51F8E0C2.3070102@dresearch-fe.de> <8337615.XrjW46moIm@helios>
	<51F9FC24.3070907@dresearch-fe.de> <20130801103622.GM3280@jama>
In-Reply-To: <20130801103622.GM3280@jama>
X-Gm-Message-State: ALoCoQnLWIA/qUKL7/Ca+fce9io4Fty1Up2NIoCLCUjx3Y+ypYUdJGcC7CEhDc09hQsqYVgKy7bP
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] SRC_URI and latest HEAD revision with git (in oe-classic)
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
X-List-Received-Date: Thu, 01 Aug 2013 10:52:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01.08.2013 12:36, Martin Jansa wrote:
> On Thu, Aug 01, 2013 at 08:11:48AM +0200, Steffen Sledz wrote:
>> On 31.07.2013 14:50, Paul Eggleton wrote:
>>> On Wednesday 31 July 2013 12:02:42 Steffen Sledz wrote:
>> ... I read something about a solution using
>> 
>> BB_GIT_CLONE_FOR_SRCREV = "1" BB_LOCALCOUNT_OVERRIDE = ""
>> 
>> which should be supported by the old oe-classic/bitbake-1.12.0. Could this be a solution for our problem? What drawbacks does it have?
> 
> BB_GIT_CLONE_FOR_SRCREV will need to clone every git repository included in metadata you're using (even if the recipe isn't built, because it needs to define AUTOREV for parsing and that needs local clone).

Every git repo? Or every git repo used with AUTOREV only?

> empty BB_LOCALCOUNT_OVERRIDE should work correctly, but you need to synchronize bb_persist_data.sqlite3 between multiple builders (if you have multiple builders populating the same binary feed).

That should be OK for us.

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlH6PgUACgkQlSfCk8EgCzhRlgCgm/sRrRd945HXKRdsj8aL/+qa
bagAnidiDoZO6PtViGA9zJfSRa+n4IcK
=rQan
-----END PGP SIGNATURE-----

