Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UZmn4-0003MF-IP
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 20:39:13 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so4228328wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 11:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=4QRRPqfLQoxY0RM1RIeqoQSzYy55LX2azMf3q5AMXHI=;
	b=Z3d2soojJA3ViNJ2AYwcavGSVAAbrIpgXwR2wtPy3JZtze6IpqYGJVgIznnn1lUA4x
	6dBVb8EmUJ3RzkCKlD3aLrnhX3Lk7sCzzwW35ShZCirjWcTGLDl4o/Y4HYtpkh2U31wN
	lQHbFTK6/N5tlSw35x/bbdl3NIXyoqVd29UgZzy5rjW3o3ML+Gtn9imYcqS3lV8qUfsE
	swLNrczgsgsnE2Rb9gX9K6hPaoU20cczWVYtzhDZywBOK5De5lYfFB6vgVu3WMrSYYlv
	kM5wlqmmIxNMtlRPsJ/T0pRQ9cC4YrjGkS4CBkXbTacFI+e+PNo6Z/EKGOApvBVr8dlh
	FRuQ==
MIME-Version: 1.0
X-Received: by 10.180.72.227 with SMTP id g3mr21918075wiv.1.1367950865376;
	Tue, 07 May 2013 11:21:05 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Tue, 7 May 2013 11:21:05 -0700 (PDT)
In-Reply-To: <51893CB4.9070304@windriver.com>
References: <51892728.3090609@farnsworthtech.com>
	<51892D8A.5030806@windriver.com>
	<51893B46.3090205@farnsworthtech.com>
	<51893CB4.9070304@windriver.com>
Date: Tue, 7 May 2013 14:21:05 -0400
Message-ID: <CAHUNapRP6SbJVhQey907pHg+X+tosP-86D_5gBs=Vkt4MPBN+w@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK meta-toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 18:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 1:41 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> - nativesdk -- runs on the 'sdkhost' (variant called 'crosssdk')

Is this related to the SDKMACHINE setting?


