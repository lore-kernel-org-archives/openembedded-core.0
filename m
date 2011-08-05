Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QpDOV-0002cg-Os
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:56:27 +0200
Received: by vxj14 with SMTP id 14so1593197vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 22:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=7YWDyBNe0z9CeKldAeQDIywVKF8CMHo35IMu2SdmUZo=;
	b=EQcCtFjKGM9FkN7qhgqhc+0xrKXjDGmU7K5/2trl67STsc3ZE1Cw4gYs1N0CP3MHgU
	yr+SNfbSt/Ctw8d8VoamEHfjqrQk6Pkw27TJRXx9LeVfmDH3prdhLjf7oJ6mFsB1XWJr
	sH8EJ9JOR+S+hUO2YtiHx+2xsFVUtXRQkGCUk=
Received: by 10.52.90.12 with SMTP id bs12mr2034745vdb.495.1312523523142; Thu,
	04 Aug 2011 22:52:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.112.194 with HTTP; Thu, 4 Aug 2011 22:51:43 -0700 (PDT)
In-Reply-To: <DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Aug 2011 22:51:43 -0700
X-Google-Sender-Auth: eyxm9-LEeOyNfchnzERhSL52GDU
Message-ID: <CABcZANmC-K=S7E0vL_4B1ys4VA_OV_r8CHpk2DNFDY0wU+7cCw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 05:56:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 4, 2011 at 10:48 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
>
>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
>>>
>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
>>>
>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>>>>

Can someone explain why this patch added the dependency to the global
RDEPENDS, rather than the RDEPENDS_<pkg> for the pkg in question?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


