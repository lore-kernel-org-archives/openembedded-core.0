Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB78607DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:50:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w55AoP6K027949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 5 Jun 2018 11:50:26 +0100
Message-ID: <81d3651d034a8ce411302c67f5718a84797e16c9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Hong Liu
	<hongl.fnst@cn.fujitsu.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jun 2018 11:50:25 +0100
In-Reply-To: <ed003177b59644fe9b7f33975d3758c8@XBOX02.axis.com>
References: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
	<20180605081056.16610-3-hongl.fnst@cn.fujitsu.com>
	<ed003177b59644fe9b7f33975d3758c8@XBOX02.axis.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] [PATCH] wpa-supplicant: fix the bug for PATCHTOOL	= "patch"
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
X-List-Received-Date: Tue, 05 Jun 2018 10:50:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-06-05 at 10:43 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > Hong Liu
> > Sent: den 5 juni 2018 10:11
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] [PATCH] wpa-supplicant: fix the bug for
> > PATCHTOOL = "patch"
> > 
> > When switch PATCHTOOL to patch, applying 'key-replay-cve-
> > multiple.patch' failed:
> > 
> > checking file src/ap/ieee802_11.c
> > checking file src/ap/wpa_auth.c
> > checking file src/ap/wpa_auth.h
> > checking file src/ap/wpa_auth_ft.c
> > checking file src/ap/wpa_auth_i.h
> > checking file src/common/wpa_common.h
> > checking file src/rsn_supp/wpa.c
> > checking file src/rsn_supp/wpa_i.h
> > checking file src/rsn_supp/wpa.c
> > Hunk #1 FAILED at 709.
> > Hunk #2 FAILED at 757.
> > Hunk #3 succeeded at 840 (offset -12 lines).
> > Hunk #4 FAILED at 868.
> > Hunk #5 FAILED at 900.
> > Hunk #6 FAILED at 924.
> > Hunk #7 succeeded at 1536 (offset -38 lines).
> > Hunk #8 FAILED at 2386.
> > Hunk #9 FAILED at 2920.
> > Hunk #10 succeeded at 2940 (offset -46 lines).
> > Hunk #11 FAILED at 2998.
> > 8 out of 11 hunks FAILED
> > checking file src/rsn_supp/wpa_i.h
> > Hunk #1 FAILED at 32.
> > 1 out of 1 hunk FAILED
> > checking file src/common/wpa_common.h
> > Hunk #1 succeeded at 215 with fuzz 1.
> > checking file src/rsn_supp/wpa.c
> > checking file src/rsn_supp/wpa_i.h
> > checking file src/ap/wpa_auth.c
> > Hunk #1 succeeded at 1898 (offset -3 lines).
> > Hunk #2 succeeded at 2470 (offset -3 lines).
> > checking file src/rsn_supp/tdls.c
> > checking file wpa_supplicant/wnm_sta.c
> > checking file src/rsn_supp/wpa.c
> > Hunk #1 succeeded at 2378 (offset -62 lines).
> > checking file src/rsn_supp/wpa_ft.c
> > checking file src/rsn_supp/wpa_i.h
> > Hunk #1 succeeded at 123 (offset -5 lines).
> > 
> > So split the wpa-supplicant/key-replay-cve-multiple to 8 patches.
> 
> Why does it need to be split into eight separate patches? Isn't it 
> just a case of having to regenerate the patch so that the hunk 
> contexts match the current code?

You're technically right but I think separate patches may be a lot
clearer...

Cheers,

Richard


