Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm1LO-00084o-1S
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:04:50 +0100
Received: from mail-gh0-f200.google.com ([209.85.160.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 03:50:02 -0800
Received: by mail-gh0-f200.google.com with SMTP id 10so2455771ghy.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 03:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Hw+WnXa/BcVbt6da/NizhbLkjP4to8D+q5iXiP+LUFM=;
	b=U8TPiaNJh4RMGBvdcNMqs3h3iVmlgAK4FfaTEYYcAvZXWqkjs9IZPbQfbPZsIrJWt3
	28ZbRbQC3fdvu3D+1j6Qu9LgUmoBAX/7wKiW6ut39VuKa/EgsSNtFyr6XnQSLqzDsM3X
	Ua+A8CR03ERazrtNGeNb+eE7+6k3FgbSxl8eS1YbtsqyjAngC4xYYwFZBqqQbMNi6iZU
	fI6hLllJIFSO3lDnBi0rzZvNt13BWWinccHa72BwGkkJntePZktD1ovUT1s5kM4b4RKq
	6fYDLP1npgh6PU7HAXOVnhh9LOxvewnagI8Oo9Un6tLaANXp5AUocbuIyvcnYNy3P9ma
	YrtQ==
X-Received: by 10.52.180.200 with SMTP id dq8mr16834184vdc.71.1356090602172;
	Fri, 21 Dec 2012 03:50:02 -0800 (PST)
Received: by 10.52.180.200 with SMTP id dq8mr16834179vdc.71.1356090602109;
	Fri, 21 Dec 2012 03:50:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 03:49:42 -0800 (PST)
In-Reply-To: <cea26d19d74480fd0056adfff07782e23e92e1bd.1356089735.git.alexandru.damian@intel.com>
References: <cover.1356089735.git.alexandru.damian@intel.com>
	<cea26d19d74480fd0056adfff07782e23e92e1bd.1356089735.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 11:49:42 +0000
Message-ID: <CAJTo0LZ29BGKgzDXQHPD+Sw7T0omUF9SRj2iH18n2V0SZ38fdA@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQkjgriHdHGheC2si1n6ih68APQv0Kk2F0S/cxPN8BS24KFlo08CwwYxbcTtGejMmEg9d/PkZv5loKNhgMqc1lzfSadBDDzXkAMhNBOmyqVHO30TWJzWM6Wi5vnXTY9xQOPt3EDpQD3BxpvuS4AweHjVXdW+jLkWkBFYxxBFtTE9utLHfrTE0HnTTazISTShxGm2Cr2q
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Initial commit for wayland/weston 1.0.3
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
X-List-Received-Date: Fri, 21 Dec 2012 12:04:50 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 11:38, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch adds the Weston reference compositing
> manager from Wayland.

Same comments as wayland, fix ordering and remove PR.

If I have wayland, x11 and gles features so it supports all of the
compositors, what happens?  Are there multiple binaries, or a single
binary that can act as wayland-on-X11 and wayland-on-DRM?

Ross


