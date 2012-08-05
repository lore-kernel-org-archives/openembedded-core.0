Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <derek.buitenhuis@gmail.com>) id 1Sy9J7-0007tV-7C
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 00:28:21 +0200
Received: by obc16 with SMTP id 16so1321237obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 15:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=nSQ3SOHyQl9uMlXGaMCVLpPMulqrGVJyfC8Z54ZRc64=;
	b=rCQ4/5fDe/NZvj6lflqR9emp9L1pK+Wos41WLW7FYU+SMLhBErxbsdvxIVGW80L1X6
	I5LEQ5bFk/Cx3LhFPBUexpru4ynB7QGivIt5BYoUNHNmKWMvSum0MjfxUsh1uW5667Rh
	8E4Xx4VVPvDkPnAj5oD1n5v2G2B6boZC53EM2+3I7REi7rREDOHYFOxsfCqxbQ+MF1jF
	+pV455HQnBPDXN9Wjqd7dJUPXhUtY512VuY1KM6yY3ZQLhBprgW+B28QYPL/Cw6DTJfg
	hwR5HRiT3qyR/snIFAjLsfitJO7UdJawL9BGzcfwpEV0Ev+5bRUhb2jA/MKMA6ht8ax0
	CKlA==
Received: by 10.50.169.4 with SMTP id aa4mr3725948igc.53.1344204996488;
	Sun, 05 Aug 2012 15:16:36 -0700 (PDT)
Received: from [192.168.1.111] (S0106586d8f4832af.tb.shawcable.net.
	[24.109.142.27])
	by mx.google.com with ESMTPS id g5sm4880974ign.4.2012.08.05.15.16.35
	(version=SSLv3 cipher=OTHER); Sun, 05 Aug 2012 15:16:35 -0700 (PDT)
Message-ID: <501EF0BC.2050000@gmail.com>
Date: Sun, 05 Aug 2012 18:16:28 -0400
From: Derek Buitenhuis <derek.buitenhuis@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343942157-15997-1-git-send-email-yao.zhao@windriver.com>
	<501D7090.2040500@gmail.com>
	<EB05DE7F-A81E-4CF6-BD49-F93604EA1EDF@dominion.thruhere.net>
	<501E9EF3.2020208@gmail.com>
	<A35353F6-FFAE-481C-9C36-F38CE110284F@dominion.thruhere.net>
	<CAMKF1sq_mpVRj+EH5cEdXRhy6h=Dy32u5o_Q8h3qXTzEJ208fw@mail.gmail.com>
In-Reply-To: <CAMKF1sq_mpVRj+EH5cEdXRhy6h=Dy32u5o_Q8h3qXTzEJ208fw@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [PATCH] gstreamer: gst-ffmpeg: fix build issues for libav
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
X-List-Received-Date: Sun, 05 Aug 2012 22:28:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/08/2012 3:11 PM, Khem Raj wrote:
> On Sun, Aug 5, 2012 at 10:31 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> It's been in meta-oe for ages. I guess we should move gst-ffmpeg (which is called gst-libav nowadays) into meta-multimedia together with libav.
> 
> +1

As an upstream developer, I volunteer to maintain the recipe if need be. :)

- Derek



