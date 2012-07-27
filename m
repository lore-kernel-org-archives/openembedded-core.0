Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujD2-0003AI-4B
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 13:59:56 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:48:21 -0700
Received: by ggnf1 with SMTP id f1so2730536ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=5lRiKH4sTXp3SipSD0naHsEgRUjZmO11tn7PDtXuGBQ=;
	b=K3fdy0hegayQa9uNdEm8O/luOVyOpvRFR4PXFDmRBJfoczByk9a+cDpcb7m4IcUWpQ
	hAiOA/2ldJfs9fUrNh2C5FObIc63Ymni41xdAt0Kul9l2Vhy5a8Gpa+yzC3UDVCliIAs
	XjQ65TfTiGnF2DsDWKbu3kt2JQSIgqKttRvaPok7R2OVhBuDnTsDcJTDks7HCPVnrRjO
	TbySjcpfuZB1byIAKeZbpoY1/eEsckFBSzaUpIgg/EbxCoy79JNe+BqcgJWyDHtM8Gkh
	Mxssr42PSwKP75baGeuiMaYU/Qz75Bw1VPt9ePg+3midf049tAL1phiKkoXzYIpxc78y
	cIcg==
Received: by 10.50.217.163 with SMTP id oz3mr1676804igc.5.1343389700566; Fri,
	27 Jul 2012 04:48:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Fri, 27 Jul 2012 04:48:00 -0700 (PDT)
In-Reply-To: <20120727114631.GJ3621@jama.jama.net>
References: <1343389394.9574.127.camel@ted>
	<20120727114631.GJ3621@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2012 12:48:00 +0100
Message-ID: <CAJTo0LZKVcaQDvVuZC_pihgeJXdau_aaNhpoXcUQtK7RjNA+Ow@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQksh86eBXL30A8i3jwGcb+nB5xDBEI1h0RhTJwJnYBkftvhhp9yfKKqvh2KTBu4oM2uyXrb
Subject: Re: [PATCH] gobject-introspection: Drop the recipe, it has never worked and if it does cross compile, we can add it back
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
X-List-Received-Date: Fri, 27 Jul 2012 11:59:56 -0000
Content-Type: text/plain; charset=UTF-8

On 27 July 2012 12:46, Martin Jansa <martin.jansa@gmail.com> wrote:
> what will provide gobject-introspection-native for meta-oe and meta-gnome now?
>
> Or should we add this recipe back in meta-oe?

gtk-doc-stub has stub machinery for gobject-introspection too.  Expect
a follow-up patch.

Ross


