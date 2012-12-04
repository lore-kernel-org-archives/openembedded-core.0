Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TftoB-0005Pm-Hg
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:49:16 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 06:34:50 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so18515959oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 06:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=v4XJ7EvOrXTW1DdjXybIbI5Nla/G2gizmI/sGxpIDpQ=;
	b=Bws7S4zOqL3v4ztCUdCBRsvOo1LvyKtmbCKq1osGC48Cst56puOEFFUByetw0zBoy5
	JuhXyTdyAmWjghvnKg6x/up6XonulEvmk8WDhkqkwXLVt8oCf6l0ZgwD15iLC1HaZ+F1
	jOIX0mUyJMAQVNKdYxMRM9N3koRKlhwL2LobIiojHn0DQmQYyw1aKD8773130BHkzQ9D
	dNcj977K4BPddUiFFy8n3zGw2DJX3se/Vzhmj79kWU2J0UooRWn0da+sCJCwmXZn/Pkq
	tugRmdl0u+4nnUfwPMsiyNxfFxloojJylSXt54g+pMde9s1WembrDlkutRLjKBvQI/O/
	4V9Q==
Received: by 10.60.4.226 with SMTP id n2mr11553855oen.63.1354631689644;
	Tue, 04 Dec 2012 06:34:49 -0800 (PST)
Received: by 10.60.4.226 with SMTP id n2mr11553849oen.63.1354631689566; Tue,
	04 Dec 2012 06:34:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 06:34:29 -0800 (PST)
In-Reply-To: <e5441f19f27ed7063c8bda010ea21bcf7af5a43a.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
	<e5441f19f27ed7063c8bda010ea21bcf7af5a43a.1354626535.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 14:34:29 +0000
Message-ID: <CAJTo0LbK78yAM1H3n7Sdra9y6dEo9VHHdx8L6Qp2zULLKgT7RQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQl6Dm84Lg3tk54TSMaiXlhb7FRIIeVu5ilmW/xZI33AE/f0bhd56JTtnnx9pUHvPkWC1I68A94cSPMwgzyB4uJXLArEulTU2NwULKbxj96KWdmjpnTG8PoaQjgy54FRZiD7PvqNBl2A9xMA1OghLSUQWL55grjYb3UgQTLyW8Pzmz/JypOHHGuUvArb/lpqqqWziaGC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
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
X-List-Received-Date: Tue, 04 Dec 2012 14:49:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 4 December 2012 13:59, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +# Update the target's pixbuf loader's cache. Since the native binary will
> +# throw an error if the shared objects do not belong to the same ELF class,
> +# we trick the gdk-pixbuf-query-loaders into scanning the native shared
> +# objects and then we remove the NATIVE_ROOT prefix from the paths in
> +# loaders.cache.

It's probably worth explaining why it's fine that only the loaders
from gdk-pixbuf-native are used and for example librsvg-native doesn't
need to be built.

Ross


