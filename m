Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8Tpt-0006zz-EO
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 11:57:20 +0100
Received: by mail-vc0-f179.google.com with SMTP id gb23so5569280vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 02:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=uBZBCUbyNqHb+wOE4XfD79g8NGaaFtNk9Sjh7W73M+w=;
	b=SYObOWy+2l4QgbOjpLNWgoDIX2GcXO5xTtQzLN0Ikv4n4TyxtxY8cFNSfSxtBFPuOY
	ajN5EF7kEGFhEDbJ5lBfVmQgpimkCJDhNSw1zXpcYiIwENueIohpqveYsPWfPGWpa4ix
	3kuAdrIC13aWDDDtV8hRUrK/ranukuS7iVIMTqw/449bWhgfBFBurBI/Wk8oHYFAvyGG
	8wwqCts6Nw42LK3C8VUJDuF/H7m4abIVX9go7voGcfnpLaTr9+L3sVdye5eW4vBdhsg+
	knhyFjDQZuOiR6rGjZaMgLJR5dXv5QEy/jCS/o9SO/TLbeXG2AgrJshJXtvqPkOXiJLT
	sfhw==
X-Received: by 10.220.157.18 with SMTP id z18mr30370847vcw.72.1361443257208;
	Thu, 21 Feb 2013 02:40:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Thu, 21 Feb 2013 02:40:37 -0800 (PST)
In-Reply-To: <lybobe0xbv.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted> <20130217231955.GF3300@jama>
	<lyd2vydizm.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LbAmTuj0dZKq7=wX5uqF9OV7dW7FXd4d2incdKSshXEmQ@mail.gmail.com>
	<lybobe0xbv.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2013 10:40:37 +0000
Message-ID: <CAJTo0LaSGjxG4vZ01jR63UTjoFL3+FNv+mRS3K5X6p5ugodD=Q@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQlddAPrdsVbZf2vcLUKUZrWHqpcQoZIdmZvAY8K445EHOB5VzSdFWeFUXOZkBSnU4alv3El
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Thu, 21 Feb 2013 10:57:24 -0000
Content-Type: text/plain; charset=UTF-8

On 21 February 2013 10:34, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> oh... this means khem's "meta-systemd: Append ${PN} to SYSTEMD_SERVICE"
> patch series is incomplete and all the do_install_append() need to get
> yet more complicated....

What was originally in meta-systemd, and what is there by simply
adding a do_install_append that just does install, is plain wrong.
The moment someone changes the directory structure. it's broken.

You only have appends where you don't do the work in the real class.
Remember that as oe-core supports systemd, all other layers can
support it too.  meta-systemd can disappear, and more upstream over
time will also integrate systemd unit files directly.

Ross


