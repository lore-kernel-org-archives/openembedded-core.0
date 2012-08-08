Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz0vr-00008G-Cp
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 09:43:55 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 00:31:41 -0700
Received: by obbuo19 with SMTP id uo19so646353obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 00:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Y0hK6jJr3N0slWlu7+hLkssPaiXNAVC/0mnwtQDCwZM=;
	b=QvNLozQlRquTHQbZopU5OsA/6SMuCgqNMTtkC/gp1BWcQDnCBJHet2Mep86qxQxA3I
	ocOlnwNZjpYlxRxnniR0/zgfH+PIPBnw6zWt05XtRARo3P3ayAZlRs5V3IJQ1rVDCZ/k
	oc+PQp0gbHL0cD1IlMHA3hsDoh6bawOYdgz3w5Z0lpENaCim35Sr8pBSujF06BheE0lD
	ttF1BccZgWnW/N6Lqy1BPz0lW549nShM9idejvb5g9Ke0i9R3lHaiOzPfNzs3X5LjTHD
	ysKrbxuc59jgPZDTMgk4wMfln3AwNu4K+JjDO1sndgU17tvb2GNCxBO6airNhbGZmwFh
	DFwA==
Received: by 10.182.51.37 with SMTP id h5mr28878542obo.35.1344411100540; Wed,
	08 Aug 2012 00:31:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 00:31:20 -0700 (PDT)
In-Reply-To: <CALbNGRSkEhgOeEE1EZ05riyxB+mLQLvwfGNuNNdCTWZhKZ0KCg@mail.gmail.com>
References: <20120718133146.0C2B910217@opal>
	<20120720231539.GB3576@jama.jama.net>
	<CALbNGRSkEhgOeEE1EZ05riyxB+mLQLvwfGNuNNdCTWZhKZ0KCg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 08:31:20 +0100
Message-ID: <CAJTo0LbK6UT9E_WUgxqeN7aB7UHC_wX_JuWeo2d9anyxcYhh-Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkFrriw5b5y6gyhRSn22XWDrvrB6DnkjiuPXb8dzW6UFMI6bHbX7DLQw4SMX4gg0P8SEn3q
Subject: Re: [oe-commits] Ross Burton : webkit-gtk: remove no-parallel bodge
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
X-List-Received-Date: Wed, 08 Aug 2012 07:43:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 July 2012 13:06, Andreas M=C3=BCller <schnitzeltony@googlemail.com> w=
rote:
> | arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
> `libjavascriptcoregtk-1.0.la' or unhandled argument
> `libjavascriptcoregtk-1.0.la'
> | make[1]: *** [Programs/unittests/testdomdomwindow] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
> `libjavascriptcoregtk-1.0.la' or unhandled argument
> `libjavascriptcoregtk-1.0.la'
> | make[1]: *** [Programs/unittests/testdomdocument] Error 1
>
> I reverted this patch and build is fine.

Bringing this thread back as it needs to get resolved.

Can you try adding the patch in
https://bug-79498-attachments.webkit.org/attachment.cgi?id=3D131681 to
webkit and seeing if it builds with -j then?  That patch claims to add
duplicated rules to force the buggy make not to drop essential
dependencies.

If that doesn't help... I don't know what the best thing to do is.
Add a make-replacement 3.81 recipe, and depend on it?  Detect the make
version and disable parallel and warn if it's 3.82?

Cheers,
Ross


