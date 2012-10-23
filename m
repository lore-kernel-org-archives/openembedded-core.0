Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TQU5W-0006Hr-Br
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 04:19:26 +0200
Received: by mail-vb0-f47.google.com with SMTP id ez10so3625943vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 19:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=Can4JqNySQQo2ukSbzpSe/3hW+rKCNpigckWrQTJ+UI=;
	b=AxSj248ROe07KM0oxc9B9NGKkETh9e59P1z48imYqon7P07h2w6wRiOJIG0sU04W2B
	+pAz2DttOfMjby/YjuaFO+v1NytxkQjfvR/eQj2Dwoh61reIohadHObKT9DBsAq+Czen
	6BfUfHeo/4dQcl3zOBYemIjIgNDLrVdrVu2Gyc2WYxsmXwQbUydIWHdbPT0i9as4Z/M4
	Mju3rzPWfGVpL5YzlmpDqYCChKQ+6bS9ka/bQFDJyzaDCCJUYnESst1FXnNTsufcbjDD
	5d6hCzCLXlmf9UdAUDLUhsBOPA97V5gGXmNfUJDaPAGXM4nmrmZoap/82lM//gXwSMsn
	j5Zg==
MIME-Version: 1.0
Received: by 10.52.29.141 with SMTP id k13mr14706352vdh.131.1350957960548;
	Mon, 22 Oct 2012 19:06:00 -0700 (PDT)
Received: by 10.58.170.104 with HTTP; Mon, 22 Oct 2012 19:06:00 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <5085800A.4060600@r-finger.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
Date: Tue, 23 Oct 2012 13:06:00 +1100
Message-ID: <CAPj87rOXzZ5EwKYCrBnYtYAQo3cUyXtXyyDSh2nKh05Gy=uY9A@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQlc2RecbmPrMN2sw67d6/XQs254hkH7iKNAB7TbvszHSLwQcdRx9Lkv96ytJ2mTcInjYq6I
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Tue, 23 Oct 2012 02:19:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 23 October 2012 04:19, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> b) Split the ginormous mesa recipe, so that it is, for example, possible
> to stage mesa gl without mesa egl, so that we can accommodate HW that
> wants to use bits of mesa.

What? You can't do that.  Well, you kinda can if you're using GLX and
nothing else, maybe, sorta.  But the EGL and GL (ES) implementations
are very heavily tied together and can't be used as independent works.
 You can separate GLU, which we've already done.  I think you can
split out the core of libgbm, but not the DRI plugin.  And that's
about it.

I've got gles2/opengl/egl MACHINE_FEATURES in my tree at
git://git.collabora.com/~daniels/poky, which goes some way towards
improving the current GL (ES) situation.  But trying to split the
actual stacks into multiple parts helps no-one.

Cheers,
Daniel


