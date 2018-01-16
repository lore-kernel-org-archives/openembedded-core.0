Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 8174078689
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 11:55:19 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id bPpke6SBhyDvlbPpmeOEMZ; Tue, 16 Jan 2018 11:55:20 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=AujAIt1P c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=RgaUWeydRksA:10 a=-An2I_7KAAAA:8 a=mDV3o1hIAAAA:8
	a=02o9UKi_zMcT6FLAtGEA:9 a=CjuIK1q_8ugA:10 a=hG5dX1DpXTEA:10
	a=Sq34B_EcNBM9_nrAYB9S:22 a=_FVE-zBwftR9WsbkzFJk:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1ebPpk-0002Uy-O0; Tue, 16 Jan 2018 11:55:16 +0000
Date: Tue, 16 Jan 2018 11:55:16 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
	<CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfHEM7AvPuqZAM2gS98fx/OCwxbCBdLw/8yFZeI7FXwAo5LHAItXt+uYBNdHXaF+f3iY39ThTk0TxXEZHIv5LV0n2IpQuRfByRhRazv/cPJakpqjk90VW
	cvOuL65EgsRRwQAOOGD7Xfjqx2/m1gIoBRA=
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Tue, 16 Jan 2018 11:55:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15 January 2018 at 17:53, Mike Crowe <mac@mcrowe.com> wrote:
>> If I add USE_NLS = "no" to local.conf, then glib-2.0 fails to configure:
>>
>> | checking for ngettext in libc... yes
>> | checking for dgettext in libc... yes
>> | checking for bind_textdomain_codeset... (cached) yes
>> | checking for msgfmt... no
>> | configure: error:
>> | *** You must have either have gettext support in your C library, or use
>> | the
>> | *** GNU gettext library.
>> | (http://www.gnu.org/software/gettext/gettext.html)
>>
>> It seems that glib-2.0 does not support --disable-nls and always requires
>> gettext.
>>
>> I can avoid this error by adding gettext-native to glib-2.0's DEPENDS, but
>> I'm not sure whether this is solution would be acceptable.
>>
>> Is there a better way?

On Monday 15 January 2018 at 19:34:35 +0000, Burton, Ross wrote:
> Have a look at what just landed in master...

Perhaps I'm being stupid, but it looks like nothing has landed on master
since Sunday.

Looking at the history, I see 1ef45d377519983df827650cd0913e0d2c8a785b ,
but I already had that change. Reverting it does appear to fix the problem
though. Is that what you meant? If not, please can you point me at the
commit you are referring to?

Thanks.

Mike.

