Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B4DE160796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:04:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so1054190wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=mRBxqu9MJJarS38TF+cus90niFNCJDAzEzL0+bnZrtE=;
	b=ue5HQ9uVAo0ZIT9Za5EM75T9v9Poxc3QDWLda6ktbRDwynzq0bHOT69dZ/lKzB5Wdw
	ZRJwH+YCS0o2Yu2vegwogW4IrrZPkwhITVLyJd+6jOOusULCBWKCcwzRilJAlHVjDiLg
	dsd3iT61d5e2lu5rS2DFXUlcxoUU8JA4PqcOm1tGNFJWRngbZvB5HaMpP/0cz8nqtz1B
	sKhjABCS09+WuM9QmRC/I8WoolvrAchb+hPTjonaAhousiK4dYPGXEtY26/le0k9TEWI
	7uen8qxMebhkp98L6wxfUjXOgROysc+Gzt6JsFoD1eLPY9tJiKh4r/Llm32T4LoZh1l9
	XQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mRBxqu9MJJarS38TF+cus90niFNCJDAzEzL0+bnZrtE=;
	b=eSZFnImOniWqr9SR2bFQtYxzWqvVEwB4bUAywaHa3YQIfM5uWrKrXNYE2j9IHmrivF
	TQ86vLu9xP4QkJZddZ0xqPJ4Z1K33MtlnfYofhcVthabLSEXVJsyLFqSgjo9ELQR3RjP
	1UwrwqFIGWpfPD+JDLQTRfmFyo09A1KoOeUT/52yJIOJnOHOEDAYM3dQjbVps/GXX30+
	5q9tCbpwv5hCiMe6wgf6QBTEtC/Y7WM0kSVo+6Hf1m3NxhNGwaX/ecOPl+hnrYnc2dk6
	+7dopNt6nC72BLhyI5zzaw5qoQx7/1U3VAxgsi3enblWqfr2Nba+DZL8QcddBOwgnlng
	GKGQ==
X-Gm-Message-State: AD7BkJLDhr1c7VoVlX3y/Neocvp/JF/LFguDw9s0TuoWlDx9lgVL1XVzUkFj+LPRB6NFYA==
X-Received: by 10.194.238.34 with SMTP id vh2mr20099543wjc.157.1456783464691; 
	Mon, 29 Feb 2016 14:04:24 -0800 (PST)
Received: from [172.22.0.143] (ip-95-223-195-210.hsi16.unitymediagroup.de.
	[95.223.195.210]) by smtp.gmail.com with ESMTPSA id
	az8sm21751595wjc.17.2016.02.29.14.04.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 14:04:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0LYuo4czMifRzRyTD4vcX+YxD0R6cmeGBAAKxL+xJgzz2Q@mail.gmail.com>
Date: Mon, 29 Feb 2016 23:04:22 +0100
Message-Id: <A5D76107-A7F2-48ED-A4A8-A452F1976547@gmail.com>
References: <C902FB1D-2399-4CFF-B128-B239DDBF9539@gmail.com>
	<CAJTo0LYuo4czMifRzRyTD4vcX+YxD0R6cmeGBAAKxL+xJgzz2Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 22:04:25 -0000
X-Groupsio-MsgNum: 78934
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ED38F375-4D84-4096-BE02-46F86609303F";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_ED38F375-4D84-4096-BE02-46F86609303F
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> Am 29.02.2016 um 21:39 schrieb Burton, Ross <ross.burton@intel.com>:
> 
> 
> On 29 February 2016 at 20:19, Jens Rehsack <rehsack@gmail.com> wrote:
> +PACKAGECONFIG[dbus] = ",--disable-dbus,dbus"
> 
> With --enable-dbus for clarity?

Ah, not cherry-picked from test-branch. Send new one tomorrow :/

n8 :)
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_ED38F375-4D84-4096-BE02-46F86609303F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW1MBmAAoJEESZlq7c5QqdlisP/3472ueC5MxBxJdtGlR9Hesn
dPB1Jpd6CB/JQYYto1AdK2OwxSN4wnffnVx71S6+mO6fASJyhzGFl05dBVyN9QfA
mNk71Gf5uIwbM66FwliOkdXd4D1Av2Yuz88jze9JsQ9KcjiWrMQKVEKydW++pb/r
4FTQ5DWt17rlAPN7fEaKsHmYCA4By2SYFlaThza0hO7V6qfGlhCaBpERUxK61B4I
17YVSG0ZeWE6zLHHKmmOaOncd00VUy0Cr4RiTVsDI1jqBlUqVKmnPeBZeNvjXhCr
N/cRZDlQ9xhYSNmZWtRZcdAiYy/Ha0gSt9PXgqu2wkAuJTTYAwL8NJDO9NMTH7Ul
n6SRVRYmOATIlejaBqR1Lr7PCCPXj10go5t85p8l1dHj7pa2wbPtSPmHZN5aRA92
v4GjvoiV7JqlKnbmALu+AWcMpoQnGuxqHoX5a7XaEWVjrFt9FsVCUynepFjBk2xu
CiuqDBnvdRON66SmDJvI1fDRgSBiNg93zCDLrbn+gVwFhoke2TIdRv+tYY8FgzEJ
x3qgs03KkGj9VHxVDvR222eocEW3Li6LwGd8zEJkkYBbfzY5rhKO4vV1SqgAjL12
5Nfkrct5ioPqbiuWl2OUUssgML51TpZvlBtSGGP5PGM3P9ZsoMaw5rSOUwz+f7W0
SI5RG9e/mt9R8j4DHEDF
=yQpA
-----END PGP SIGNATURE-----

--Apple-Mail=_ED38F375-4D84-4096-BE02-46F86609303F--
