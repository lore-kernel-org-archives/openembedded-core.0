Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAxH3-00036u-0Q
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 06:42:53 +0100
Received: by pbcum15 with SMTP id um15so2028364pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 22:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/UcOTHl2MySdOr2I8vCqe7g9hslz+/eg6FBkQldxf6k=;
	b=j4ygi/3aUefPsiXJzz7JHXTRZ2lMeNDG0Hx94Lh+P8v3N/S6+y2hqt99NAypPZDug6
	6FZLuCBUM1DqaFA1oEYWt+SCmsSinzXx54NtZQ2yHZyIhiJPxssmosYi2kX3smTJcXNq
	tGoyr1piobcR2Hx+fZM03Ztb27RctVi2YG46WSguRZLs1+C5KXMVQZUt72O5qf6VphiP
	SaoQU1pPHcHfvi7cP+15rlimFZ0ROsxMPx855Er9pvjo8uMNQPg2BwMT2syQcoITBCXa
	SAv07UJIr5MBxZivtNJju7GfnF8BvT47J+md8tWCw8BhNSUiy/Wp+DsPdeZXsuvLf9xA
	PGgQ==
Received: by 10.68.235.106 with SMTP id ul10mr19971460pbc.91.1332480836393;
	Thu, 22 Mar 2012 22:33:56 -0700 (PDT)
Received: from [192.168.1.79] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id n7sm436213pbk.56.2012.03.22.22.33.53
	(version=SSLv3 cipher=OTHER); Thu, 22 Mar 2012 22:33:54 -0700 (PDT)
Message-ID: <4F6C0B3F.2090100@gmail.com>
Date: Thu, 22 Mar 2012 22:33:51 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
	<20120322223127.136698cf@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137C00E@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137C00E@ORSMSX106.amr.corp.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Fri, 23 Mar 2012 05:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/22/2012 02:48 PM, Kamble, Nitin A wrote:
>    Can you help me understand why renaming readline.so to readline_d.so
>   is solving the core dump (or double free) issue?
>
>    As noted in another email, the host gdb on fedora is able working fine
>   without need of readline_d.so; so providing readline_d.so is also seems
>   to be a workaround over a real issue.

I havent been able to reproduce it on my end exactly here. The problem 
seems to be that the readline.so library is being released twice 
(somehow) it could
be that fedora python carries a patch that solves this issue. I havent 
looked. Once I am able to repduce the crash then I can comment more.



