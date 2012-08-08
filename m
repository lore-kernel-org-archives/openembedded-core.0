Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SzAVk-0002Zm-Fa
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 19:57:36 +0200
Received: by eaad12 with SMTP id d12so266924eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=aaXBPTaFEPlTsqnz81io5cljHdZ6qxUNayOQtgKs3qA=;
	b=CTjvSGk+7vI+iHunvw/N57EbA7HYsH3meUxscUjK6R05uRIqWwrW+VFpBzdVzAAL40
	lio7Vt/kF/EC5pWQrt2QReYmp5prtZUy5g5sL7ttNjNebCjq+o78YLSuXZGHrhu6ekFW
	WASuSxTN0TSVGaQOPOo9MXoasH3ag1QMynvisMsT+xHrsMxHPWRlLqliMGlcglXJ8qPE
	ytKERqdlXsOUqiEIFXNux9DP9hc3AU3ffpjG0Sm1hdzoQsfn8zFWyo4No3dGkD3KlTXj
	XIKqPriZa6Us8rNr2MCdSHMQFX7CqKekGE1bLUgl8hk5hJX7yZN+qFkfW27e7tpu7O03
	0gTQ==
Received: by 10.14.173.71 with SMTP id u47mr884770eel.22.1344447949319; Wed,
	08 Aug 2012 10:45:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Wed, 8 Aug 2012 10:45:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2012 10:45:19 -0700
Message-ID: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Wed, 08 Aug 2012 17:57:36 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Binutils 2.23 branch has started upstream. Given that toolchain
components require a lot of soak time, I have created the recipes
for binutils 2.23 and pushed it here

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.23

If you are using angstrom set

ANGSTROM_BINUTILS_VERSION = "2.23" in local.conf after pulling that branch
for OE-Core it will work as it is

Let me know if you see any errors.

I will keep updating it until 2.23 release

Thanks
-Khem


