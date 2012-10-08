Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TLFjH-0007LC-1q
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 17:58:51 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so9980042ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 08:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=AHnZMVwss94b5DxG6UtUr4NhhY0xxjmpEROFx6y7JA0=;
	b=KUnsiSWwg1Q0ISEwt7xwKueSQmyWpWwFlLqwi2SwLKiuKr6hBO0W6ISyHQLyf0EJNn
	srRHrZaCIqtOjS0IzCni2VVR40TRXCAAe2ScuhcdRc4zmXwcqSfxc+/QA2PkIkfrvRuh
	JXjaY2WQNfTB9X9lpu4ZqXC3r7FIR/4BZ9cAo3ONlDFwsko3CurJ36q60R5rMtp0uISV
	VplHS4zEfgAUmwh+oCvGFA9i8XSe1OllN7yk8tVHSQ8/WvaSkAb295kZLLtzuS/9rfo2
	Kawj2d+pasY6myFelbwdElVRhIiMN5JHihwf05jtPE2mCFRrJ7siQb3dS75qcLibHn2b
	Rl2A==
Received: by 10.50.91.195 with SMTP id cg3mr6355487igb.57.1349711140469; Mon,
	08 Oct 2012 08:45:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Mon, 8 Oct 2012 08:45:20 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 8 Oct 2012 18:45:20 +0300
Message-ID: <CAK18fxGx+aH7nnGOa-36hAJkUQJEaEzrqVK9HOZ_gPs_w71-fA@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmIkVF4SfPtlfHZnR8OlswgGbRHYmR35KWEYrU4igms8tYp6FF/TRMc59Ht4ZJ+krhkTjsf
Subject: Systemd fails
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
X-List-Received-Date: Mon, 08 Oct 2012 15:58:51 -0000
Content-Type: multipart/alternative; boundary=e89a8f23532913ba3b04cb8e1db9

--e89a8f23532913ba3b04cb8e1db9
Content-Type: text/plain; charset=ISO-8859-1

tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/systemd-git-r7/git/src/journal/journal-verify.c:69:
undefined reference to `uncompress_blob'

Any hints?

ag

--e89a8f23532913ba3b04cb8e1db9
Content-Type: text/html; charset=ISO-8859-1

<div>tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/systemd-git-r7/git/src/journal/journal-verify.c:69: undefined reference to `uncompress_blob&#39;</div><div><br></div><div>Any hints?</div><div><br></div><div>ag</div>



--e89a8f23532913ba3b04cb8e1db9--
