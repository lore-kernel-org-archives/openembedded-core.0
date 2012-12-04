Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tfpbu-0001XR-Ou
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 11:20:37 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 02:05:54 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so17408176oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 02:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=bgfgxs4Y8Qvijji8wG3hdxHfANK+42iB7pYPrUQhi9Y=;
	b=QLLKZuq409Au2kXgqyS3wY9+Qlk3HMm/ikkvWZLtG3BLYFnb28vjrX7nZoU4FaQs6q
	KZifz//QmsTxHiyXfhILEaffPnxOHR71WDbdqJaQwC552DvSakeEwP7gJ+czctmmOzLX
	dxGNZkCqIGTt06vEkkElZRxHQ18hP8nxE8sQ51w1O0aqV7UbA4jEPuudDLCv74ZAD1Ry
	cFuZTBJDxAIsrvNeNTc6kVKBJ2wPpTT+0oncOmCaDO2pezAj0oA8jXPND402158HEu/N
	Qw8/kuF+RYpqqQNUQksjTvtUtvH2Xyo+/eMR7XtzVDHrWeVfozzHtkSwp0wUdWakJtc5
	NMkg==
Received: by 10.182.54.103 with SMTP id i7mr7036013obp.62.1354615553873;
	Tue, 04 Dec 2012 02:05:53 -0800 (PST)
Received: by 10.182.54.103 with SMTP id i7mr7036009obp.62.1354615553799; Tue,
	04 Dec 2012 02:05:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 02:05:33 -0800 (PST)
In-Reply-To: <CAGiJk9c_5nDZbTwTo1DvHXMEtOXgO=4-YvbsDoD-ZXqY=cTi8g@mail.gmail.com>
References: <CAGiJk9c_5nDZbTwTo1DvHXMEtOXgO=4-YvbsDoD-ZXqY=cTi8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 10:05:33 +0000
Message-ID: <CAJTo0LahtxpX1G5BKkYxCaN7hyJkkS9riXF0btP8XMWFJzzxfQ@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQlopvsDO+pA3WkpXTUDe7uUU1DNq99SpoWsAiWTsnC9ztqxi92TUStPNQKS9eHlBi+8y5475s13tkwDayWZZLJ87QR11ATB/3TWCJRH+T5+Wbr4tjQWTs1Ka0XbFueLi5e+Rx5In4geaUhyN15giIKzlhS7qU4RfFrR7b/oexHL7dMV9O8nJP0omGdgxk6drwJyXgj9
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: EGL / GLES issues (mesa)
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
X-List-Received-Date: Tue, 04 Dec 2012 10:20:37 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 09:09, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> So with my last update the behaviour changed and applications using EGL now
> link against mesa instead of libgles-omap3, but deployed in my rootfs is
> libgles-omap3.
>
> This results in all Qt applications being broken (as I test EGL enabled Qt),
> the resulting error message:  "application-name: error while loading shared
> libraries: /usr/lib/libEGL.so: file too short"

Why is mesa being built at all?

"file too short" is a very interesting error message that implies the
files in your rootfs are corrupted. Can you verify where
/usr/lib/libEGL.so* come from and provide ls -l of them?

Ross


