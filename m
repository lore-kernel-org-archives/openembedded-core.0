Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id A03DA7FEAE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 14:43:11 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id c4so5894040ilo.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 06:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CQZNO9DXBvp45eytghKYFThsvjVv2UF+C5LmoW3iH24=;
	b=uqdQRiadD5Ovd/30iFkRwHI/+zKWcRu48kN2P07qVKDZDgaay6k++1ZfHVi25f24A6
	BzeG1l+GVYGGFBhtb5MNKUfCBRchydxT21dhU7E1YEDhY1uV9gU5RlFSDhFS3R/5KEe6
	lAGP3XvDbTG2F+4dWBwOsBrLrMmXPnBMLAfONtNJI6RA+2F0hsVqqT3HkrgbOl7TbtHn
	/6qr0Cw6HgrMib135G2jhVpkuVoS9XZeBB7MD/EFNtCXQXNrzGvcNmU1Zl/5bJCWRIpC
	RkApRDzU0ZEkrYaBxfCMFSTRybpnRhfWQY6USJnU6JTqP8jQc6e+PnvKAF5RVfG2Dfqg
	jcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CQZNO9DXBvp45eytghKYFThsvjVv2UF+C5LmoW3iH24=;
	b=g5XN28xw+c0mq1BNH6FOF1K6d2bK4G1UNeIEyJkDCbWXlOY8yynsef1AL0yWvOWyVC
	ouYZUceKgZdFSKS2/x+PDp9+M5NicDQJ/o0q/4yPuA9q+K4JgPY7cJKkRNVr7t1Y3A86
	gbhtwDBWuc6FT9mBaRp2Ojr1EYb6K4/xMulcCPmoy9lsSx3rdr4VNsEAEXPzncThFvqQ
	EaVBZlEGsn/DiPOeHXj5rUXQzcW0/CQS8cW4VyC1wfrg7DxjXAgy0b31XMvk//hAsS5A
	figCBoT/F2LWkMzwfauXkzSNYpPlO6eaFMFLqCsjT9oaoODAGaTLDZ31ni/mY9P2dp+2
	tUng==
X-Gm-Message-State: APjAAAUn8c5j+RNWV/1+FnGLOTLyHBCbEYNoOM9r9AAoIINueMmeXGaW
	5SSYQt3Rvo/ZH68LXA2zP3cNv8jM623innX+X4Y=
X-Google-Smtp-Source: APXvYqxLdGnDp882GPwzKKBilGQM+v3gUrPlkLbT5BeKiMqi/PLu8xfFp7jP9NheUS7GqoQf95GkOqEqL2qOn/hiJoY=
X-Received: by 2002:a92:af08:: with SMTP id n8mr8739343ili.217.1578580992606; 
	Thu, 09 Jan 2020 06:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
	<CAO5Uq5SE6S+f6Xfctp-CGHd7+4j3J66YnxzL7J+QepbV-EKLdQ@mail.gmail.com>
	<c6225d2a-6f86-0c23-004b-3920432f2ae4@intel.com>
In-Reply-To: <c6225d2a-6f86-0c23-004b-3920432f2ae4@intel.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 9 Jan 2020 14:43:01 +0000
Message-ID: <CAO5Uq5TUB3JzvqCduXEtE3m6MN1d0gyZZup9V71J2ocu4tH+mg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] manpages.bbclass: Fix rootfs host corruption
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
X-List-Received-Date: Thu, 09 Jan 2020 14:43:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 1:36 PM Ross Burton <ross.burton@intel.com> wrote:
>
> On 09/01/2020 02:30, Alex Kiernan wrote:
> > On Thu, Dec 19, 2019 at 10:17 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >>
> >> When running mandb we end up with files owned by the build user, correct
> >> this. Also pick up non-default locales and relocate their index.db files
> >> to /var/cache.
> >>
> >> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >> ---
> >
> > Ping?
>
> I never saw this on the list can you repost please?
>

Sure - it's the companion to the one I think you'd started to look at
("Enable rootfs_check_host_user_contaminated"); I was fixing up
manpages leakage, but you found some of the font stuff leaking host
users into the image.

--
Alex Kiernan

