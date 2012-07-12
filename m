Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SpQwV-0008Bh-Dr
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 23:28:59 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Jul 2012 14:17:44 -0700
Received: by qcmv28 with SMTP id v28so1637216qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 14:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=mVlJ6XAZW0L6Zh7K4zIdOMJNygwg4rF0W4IasRE2w+Q=;
	b=THjTza0BgaQTuHG7hGCOIJ7JMQwsco+Y2JzB3u3RP0TF8mWIHxMSLhkd6LFQuwSJE/
	v5ByrdRMVHjtHTLGcGLcwBr7NJgSfRr6DzLggfZWHfA+MHjPT5jwlX8R2g9sqhRmfc62
	tTLFT23rSKz7WWA6QNygwG0mIL0CY0bFstWuiKFx46oQjE9ZvZBOXFIUEp6D//tpZ8Q6
	lcr/4meU5ABd7XoGsYlvH1tQbO4IE+JFYj1ycXV69AYCkGOK7yySXx08XzjEktp9C8jx
	8JmupK1TBuDMqtM89WV+whnwj1UNeT9YlZshgcCGzfyAHWRjmKgz11xdLIJiI2zpjsbj
	i1pQ==
Received: by 10.224.196.135 with SMTP id eg7mr7176586qab.24.1342127863778;
	Thu, 12 Jul 2012 14:17:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Thu, 12 Jul 2012 14:17:23 -0700 (PDT)
In-Reply-To: <1342044016.4095.45.camel@lenny>
References: <1342021183-30173-1-git-send-email-ross.burton@intel.com>
	<1342044016.4095.45.camel@lenny>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2012 22:17:23 +0100
Message-ID: <CAJTo0LZqH4_8jdgX4RmO0SnZppGy6S2DWK7HDkoHO7JjO3fcAA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnp/hRtTPKQ1BHqQEUmI0Kqt05DSeH33cn2giI22P2GHTpihgbFNWZUYUy7c+EReNrZj9yE
Subject: Re: [PATCH] connman: fix build with automake 1.12
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
X-List-Received-Date: Thu, 12 Jul 2012 21:28:59 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2012 23:00, Colin Walters <walters@verbum.org> wrote:
> On Wed, 2012-07-11 at 16:39 +0100, Ross Burton wrote:
>
>> +     # Automake 1.12 won't install empty directories, but we need the
>> +     # plugins directory to be present for ownership
>> +     mkdir -p ${D}${libdir}/connman/plugins
>>  }
>
> Did you consider patching upstream to do this in install-data-local
> rule?  That way everyone gets the fix (Debian/Gentoo/Fedora etc.), not
> just you.

Yes, and I also considered that this surely can't be restricted to
connman and automake should have some clean way of forcing an empty
directory to exist.  I'm also pretty certain the automake maintainers
response would be "do it in install-data-local", so this should go to
connman...

Ross


