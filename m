Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5B53E7D270
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 05:17:59 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id r21so53949437qke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2019 22:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZIse+oNGG1mULcJYLWioKYxBOc4kpEs2UoxkUbqny5I=;
	b=YHyygI0oc9BRN6L00X9mxgWikrts9M92MNV3zuYnutvrP+s43VMWbPX4amIQJB3zwt
	Ad6INngHxBYhfNEswP9+fjxFKsV8e3GqSzhg7HYF0SsB5A7XPbaxyAV5ems4mCQWhKnk
	FGGZPjo5MX6GNFHOb29EjhNQq3fyT5LjrlgbFLkoVzn226Jc5xhgW1EPUuSeH5kzhooe
	mIrmXwX0GEUeVOubYGXtSmWhwCS4YkBUARauvYyFANTxGKJFeu4R4qaSDK/xZ2g9+O6e
	zR6cezVM5cNE2tfHj0F2Q9M4c0UH3ACmcHh89VWMtxNvh04/YclE5l1GUxXZ8OGadljh
	r2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZIse+oNGG1mULcJYLWioKYxBOc4kpEs2UoxkUbqny5I=;
	b=DI6QgPK7T25FpF5W2apMBldIi6BNqVIWL4Zmd4l2w+W4wPLJk940cTL/TPBO3QL8C4
	qDY/9rUtDXT9qjV6+1NukT+MAeeVlQnYyomBjCSf3KeOoVDNZC8PFC3gSAmPGHRprxvA
	zpJ3oeWYm2YyQCOHPGoraTtlAlXd0BuSuJIKYOWRElSV37u4q568pR+JGj4mds9mzC7h
	Uqo27S16lcAeZZTpw0AazSSndgU4GZHlGbBsVI6yy/9dW+YQQi/g2pnFVRI+HdQKji8N
	k/NZ3k6AcciWwl7Ldfu3sGV1sg/Uc+hCoTAhS73R73lGCgjzZetD9wwROuWGm+Pg65FP
	wD3A==
X-Gm-Message-State: APjAAAXGiu0jNIqFsPNyP5YscP0BDo848wd00XqZ6myCE/6l1LMbeEz4
	2NRXyZqzhnTzr8i2/wNnrt7mfoxIs9u1ZTR43mk=
X-Google-Smtp-Source: APXvYqwgcoyoD5kxt7dzmvNmzKUj9V69YnhlAEd+LX12O5Wc7p5fM/UbQ+seektWrrV9X3Zfb1n2x/g+O8V9pLBdyRg=
X-Received: by 2002:a37:4243:: with SMTP id p64mr71419882qka.9.1564723080042; 
	Thu, 01 Aug 2019 22:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <6ce08045-fb67-aab4-9ff5-9f8d511eeb78@topic.nl>
	<99ef1d9c-c642-92b3-33b0-aafc38c8e62b@intel.com>
	<63da8199-4e73-70e2-bcea-60f7e53a2e16@topic.nl>
	<487ea47b-1db4-8c95-c0ad-661a56ccc07a@intel.com>
	<b2880fb2-75a4-825a-6bbf-8a07df8cce55@topic.nl>
In-Reply-To: <b2880fb2-75a4-825a-6bbf-8a07df8cce55@topic.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Aug 2019 22:17:44 -0700
Message-ID: <CAMKF1spF9OXtEz+GCA6zzD1Wyr=q1cfaxJmA7xCXauN+CB18bg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: SDK does not contain pkg-config files
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
X-List-Received-Date: Fri, 02 Aug 2019 05:17:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 1, 2019 at 4:17 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> On 31-07-19 15:29, Ross Burton wrote:
> > On 31/07/2019 14:22, Mike Looijmans wrote:
> >> Well, that's at least good to know.
> >>
> >> I'm on the "thud" branch currently, so I hope this isn't something that got
> >> fixed only recently.
> >>
> >> I'll try some simple images first. I gather there's no particular magic
> >> incantation I need to put into my image recipe to get the pkg-config files
> >> into the SDK sysroot?
> >
> > Right, they're just in the -dev packages.  I'd try building a
> > core-image-minimal SDK to verify that works, as I suspect you've done
> > something in your image to break the SDK.
>
> I think I found it.
>
> The image installs the dropbear SSH server, and the openssh-sftp-server. These
> seem to cause a conflict, and then ALL the "-dev" packages get skipped.
>
> The warning looks like this (I removed some sensitive information and a list
> of a few hundred package names):
>
>
> WARNING: prolira-delirium-image-1.0-r0 do_populate_sdk: Unable to install
> packages. Command '.../..-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> --volatile-cache -f ... --force_postinstall --prefer-arch-to-version   install
> ... binutils-dev liblzo2-dev ... libaio-dev' returned 1:
> Collected errors:
>   * Solver encountered 1 problem(s):
>   * Problem 1/1:
>   *   - package openssh-dev-7.8p1+git-r0.cortexa9t2hf-neon requires openssh =
> 7.8p1+git-r0, but none of the providers can be installed
>   *
>   * Solution 1:
>   *   - allow deinstallation of packagegroup-core-ssh-dropbear-1.0-r1.all
>
>   *   - do not ask to install a package providing dropbear-dev
>
>   *   - do not ask to install a package providing
> packagegroup-core-ssh-dropbear-dev
>
>   * Solution 2:
>   *   - do not ask to install a package providing openssh-dev
>
>
>
> If I remove "openssh-sftp-server" from the packages, the warning (which should
> have been an error?) disappears and the resulting SDK properly contains all
> the pkg-config files again.
>
> I wonder if there's a proper fix to prevent this, i.e. break the link between
> openssh-sftp-server and openssh-dev.
> --

RDEPENDS_${PN}-dev_remove =  "openssh-sftp-server"

in openssh recipe might be able to do it

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

