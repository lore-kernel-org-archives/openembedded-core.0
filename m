Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWQ6-0002K9-EW
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 15:39:23 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:24:44 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so14467481obq.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=0JLZglOwmebWDy6xLnkXoTcHnewGB/GMnsDWcgLPX6c=;
	b=UgN8XsytI5nEmy0ea9YlUd8aaLESRzyyk1BvsznsDKRH7l+vM97PVLM0dO61Mmt0G6
	XxekLV7jCN9HKJBPoOk9+5XkFRjnqOCdaUbJLd+rUFEiGuaSUtKY1ama0xlar4dDTYC4
	GyU3WF0UH0is535HAZMxnUnsEp9/Ln66AFmv5MobFIZAGRHS+iAhjka0Eexygb5j2AKu
	drH+eZE+Ws24CGrvqaE5azwvLe0DZGdpru0DM7EPrlwMh79E/0z1GOZCoWOQrUlLZMv1
	aEnqoUHZx8nZTJ5CunwSmLTGNHxRuDt4AeSCZ7MkpAfqCz6JyC7V97pd9lbLwmikfbNO
	S20Q==
Received: by 10.60.4.226 with SMTP id n2mr4693664oen.63.1355495082500;
	Fri, 14 Dec 2012 06:24:42 -0800 (PST)
Received: by 10.60.4.226 with SMTP id n2mr4693658oen.63.1355495082353; Fri, 14
	Dec 2012 06:24:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 14 Dec 2012 06:24:22 -0800 (PST)
In-Reply-To: <50BF13CA.1050808@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
	<e5441f19f27ed7063c8bda010ea21bcf7af5a43a.1354626535.git.laurentiu.palcu@intel.com>
	<CAJTo0LbK78yAM1H3n7Sdra9y6dEo9VHHdx8L6Qp2zULLKgT7RQ@mail.gmail.com>
	<50BF13CA.1050808@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2012 14:24:22 +0000
Message-ID: <CAJTo0LYuuu8EFZy-cGH910zd5hch8g0oaS-h6U=hi-tVQc3d5A@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkexfcJn55oxQZg5YDlTT4sEQwtkFQ0How5EijezG67nX8+ZV0eA9NdT4ZdML8HLgK9iY9bMKk9YOnoVULB/MlnbnaE+Znc2wK4Fv7TKjRa01FYQGQEOr4HmDkSCVg9ae2ASnDlYGTCBf1GFFCglQ/60oce5H+PcuZe6Xe/RLKgGk/l4DOjemVsadlsiWQwLhzVETTC
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
X-List-Received-Date: Fri, 14 Dec 2012 14:39:23 -0000
Content-Type: text/plain; charset=UTF-8

On 5 December 2012 09:28, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> However, if we want to be able to run all postinstall scriptlets on host
> in order to support read-only rootfs, we might need to have
> librsvg-native built too so that we generate the pixbuf loader cache on
> host at rootfs install time.

Not true - the icon cache explicitly only loads .png and .xpm, so my
point was that it's entirely safe to run gtk-update-icon-cache at
rootfs time as those loaders are part of gdk-pixbuf, which must be
available natively if we're running gtk-update-icon-cache.

Ross


