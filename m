Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShiqO-0002tp-KQ
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 16:58:48 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jun 2012 07:48:01 -0700
Received: by qaeb19 with SMTP id b19so4242063qae.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 07:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=D0RawzVTF7IwoRpewSFD6sDFKTFQ+yBcoOFXGt7rk7s=;
	b=W98G6uYAvQcYdgM2B+ihjwA550mcavs9E31oASIz+MSherCChvSGMLxTxsyLCtSDHS
	fTRYjVvsIkOxHWck5LCFGleKI4mFOwjExXbKGumehI1kCJLfnUrF5CMgxyb3N7rGByQt
	e6ICxCc20NJeGlYeR8e+60tBx8x0VDDhjz9+OyUBuB1k90JM0WrcQxRRkRmtZHIm76T4
	LChNlR8Lkmw/ayvINVL74DSwRXeu3l1t7fBiqxSCoSAe1EQ+RI9/b5A0mSrS6vvxLLuB
	G7wJkNu6FPr//87kya6T5Djurycp53ioPTCpidDzNhM0aOHvFZFVRjJwDLKpW7UX2Tmm
	IeVQ==
Received: by 10.224.39.75 with SMTP id f11mr48370090qae.70.1340290080255; Thu,
	21 Jun 2012 07:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.101.202 with HTTP; Thu, 21 Jun 2012 07:47:39 -0700 (PDT)
In-Reply-To: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
References: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2012 15:47:39 +0100
Message-ID: <CAJTo0LbxiGwhhdXca8g9c5n-q7huz1Amfj+Dtk=U0UhMdh0Ktg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlttC4YMyOEoHO2HdPzKdbSMP6e3AEGOktQ/4UUcIuyUxXVDx37xtTRkqMvOmA/EPtg7/Bo
Subject: Re: [RFC] Fetching single files
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
X-List-Received-Date: Thu, 21 Jun 2012 14:58:48 -0000
Content-Type: text/plain; charset=UTF-8

On 21 June 2012 15:01, Burton, Ross <ross.burton@intel.com> wrote:
> The next step is to hook this into the
> unpack stage so that the file gets renamed correctly on it's way to
> the workdir.

I've been speaking to Richard and he suggests implementing a universal
"rename to" parameter in the unpack logic, and setting that inside the
svn fetcher when in singlefile mode.

Ross


