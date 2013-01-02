Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqORU-0005VN-Ho
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 14:33:12 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so13998208vbm.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2013 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=n+SbMewVS8kpV1gFYX4bGdaxbq0sJiqq75OrO6Fiq9M=;
	b=jyM0hSnfieSPEg52TLAqHMFJImUUTuNou0Mn/LGbZ0w4V+nF0sbnrRv/ykt3pZkWOY
	1UloMJxdNdA9L+NW3iY0ZFybPcSJ6w5X7SRPuRLRudu4uQLvQT/HWb8DTKugvHn9x3EI
	udqyazP9Oz063bbxnRIX0uUMUiGlJWpUu6V8bup+IGLBDjOUmoaJI26j82PNPhsTx1+h
	JargyW8cn1w38PXfia3BY1F2VfDcTBz2SC4AmrfzpDfbCaeVj+XXt6ZoPK7u496v93Ee
	J4/iaxjciWeek1OqAf1eAf5RJBUrJiTeIJz1qld7Eq0723oP3NiI7IiAp+1lZESKZj1a
	i9PQ==
MIME-Version: 1.0
Received: by 10.220.108.79 with SMTP id e15mr69701020vcp.61.1357132689841;
	Wed, 02 Jan 2013 05:18:09 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Wed, 2 Jan 2013 05:18:09 -0800 (PST)
Date: Wed, 2 Jan 2013 15:18:09 +0200
Message-ID: <CAF6bG8enFZOa3A=S-4KLowpCZyed_iD6D-GYFvExWvvyzWFENQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: yoctoproject patches (prelink)
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
X-List-Received-Date: Wed, 02 Jan 2013 13:33:12 -0000
Content-Type: text/plain; charset=UTF-8

Where and how should patches for git.yoctoproject.org projects be
submitted? I'm working on patch to make prelink to build with
automake-1.13. For testing I'm applying it in recipe, but obviously it
should go in to upstream.


 - ML


