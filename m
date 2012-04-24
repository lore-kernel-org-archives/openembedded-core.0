Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SMp4v-0005aV-D9
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 01:23:25 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Apr 2012 16:13:49 -0700
Received: by lahi5 with SMTP id i5so851323lah.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 16:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=livEdWXcZ7QiAeK4YUV8b+A41dwJo+mzV9cpBuNcS9I=;
	b=WjcKlhm0Iy0NNCpJTHleRYNqb2rzOvifcyjW5QF4rbrIvurZ4QLMM5vZhcZGQ5PNSE
	74RzsOOR8k9Nc6F/lUmehPdL4zTXMxszoZpaheH093NjG3qoEp3aIjUZNnKZM1+X+jTZ
	BT5GCivfeXYYhYualmOdYTMe0E5202t8recQ7ec1PWGY+o4q0irA2jWgHrOLTKT7619K
	1MAl4CW2A+Ehw2CaNSCfzDfUGNL+BUf+3A58nTygVbyX1LN+Lg5p+Beb/Y7vZW8hd8mJ
	euo7sw/qm6xBTe1CayKPkCqc4H+GGa6u246e37mX/4OmRZHAKQ9+JapXtlmQl/WL62io
	ugcg==
MIME-Version: 1.0
Received: by 10.112.103.8 with SMTP id fs8mr194630lbb.29.1335309227179; Tue,
	24 Apr 2012 16:13:47 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Tue, 24 Apr 2012 16:13:47 -0700 (PDT)
In-Reply-To: <CABcZANnyFDurr+B6nW5nJz+3kq2RXp4403Eqhcahkt53ififeA@mail.gmail.com>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
	<CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
	<CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
	<CAPhnLPCWAKLiLUfKVaguN_cFA=PAgRhW4vZ-pa1XDtW=Wugvpg@mail.gmail.com>
	<CABcZANnyFDurr+B6nW5nJz+3kq2RXp4403Eqhcahkt53ififeA@mail.gmail.com>
Date: Tue, 24 Apr 2012 16:13:47 -0700
Message-ID: <CAPhnLPDfjVWLKSDTwiZDCBNpHE7CKXuWfzTMccAuq-ruPtsW9w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlXaWpjtfvadZ0EKJ37SFnMkfhF9eVEczTzlXM5YHKhH48L20pbyzpDXcv/4LKZv2VjNlvX
Subject: Re: LICENSE_{X}-xxx is parsed?
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
X-List-Received-Date: Tue, 24 Apr 2012 23:23:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 24, 2012 at 3:53 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Apr 24, 2012 at 3:38 PM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>> The rest of the packages in the bb should be inheriting LICENSE if no
>> PN level license is set. Which obviously causes problems for the above
>> example.
>>
>> In a case like above you'd want to do either of the following:
>>
>> a. Call out each package's license individually (better but can be
>> painful for recipes with lots of packages)
>> b. Leave GPLv3 out of LICENSE (easier but not technically accurate) so
>> undefined package level licensing inherits the correct LICENSE.
>
> I wonder if a partially specified set of individual package settings
> should be identified by some sanity check (an explicit, rather than
> implicit, one, like recipe_sanity) as a potential bug / source of
> confusion.

It's something I've been thinking heavily about how over the past few
month. How to implement full package level license support without
requiring too many recipe changes. The current setup licensing moves
us in the right direction, without having to do too many recipe
changes, but there are some inadequacies in it and we may have to
address them sooner or later.

> I suspect most of the time it should be one or the other,
> either no individual package LICENSEs are defined, or they all should
> be.

I would tend to agree. One thing I think we may want to start
considering (even if it does make me cringe a bit) is that if we go
this route, we may want to support LIC_SRC_URI_${PN} as well. It means
quite a few recipe changes, but it yet another step in more accurate
license auditing.

-b

> --
> Christopher Larson
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


