Return-Path: <petter@technux.se>
Received: from vsp-authed-04-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD82605B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 04:38:04 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-04-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Thu,  8 May 2014 06:37:58 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-05-01.atm.binero.net (Postfix) with ESMTPA id 8F0AE3A163;
	Thu,  8 May 2014 06:37:58 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 08 May 2014 06:37:58 +0200
From: petter@technux.se
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1399501262.31891.42.camel@ted>
References: <cover.1399497346.git.petter@technux.se>
	<1399501262.31891.42.camel@ted>
Message-ID: <f90bcdd0b14a8029f93fd41a400da185@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/13] Remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 04:38:09 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-05-08 00:21 skrev Richard Purdie:

> On Wed, 2014-05-07 at 23:19 +0200, Petter Mabäcker wrote:
>
>> Fixes [YOCTO #4497] We extend the search path in a number of recipes 
>> by
>> setting FILESPATH, which is not really desirable since the manner in
>> which we have done it can make the recipe harder to bbappend (and we
>> explicitly advise modifying FILESPATH this in the manual). These 
>> should
>> be changed to use FILESEXTRAPATHS to extend the path instead or use 
>> a
>> default FILESPATH (e.g. BP, BPN or files).
>
> Whilst FILESPATH is discouraged, so is putting files into "files"
> directories so those changes are not an improvement.
>
> Cheers,
>
> Richard

I agree, 'files' is not a good choice and of course BP and BPN are 
preferred if possible. My intention in this case however was that 
'files' was an "less bad" option in the situations where all bb-files 
within a recipe used a 'common' dir to store patches. In these 
situations I thought it was more clear to use a name that better 
displayed the "common use" and since 'files' is quite a common name + 
that it removes the need of extending the filespath, I used it in theses 
situations. But I guess you could see 'BPN' as a common dir as well 
since it's the same name as the recipe (even if they are used by other 
bb-files with different PN within the same recipe). So I will change 
those commits that are using 'files' and use either BPN as a "shared 
patchdir" or try to split them into different PN/P dirs if possible.

BR,
Petter

