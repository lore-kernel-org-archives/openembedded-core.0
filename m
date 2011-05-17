Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMNcs-0000pB-HI
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 19:00:07 +0200
Received: by ewy5 with SMTP id 5so208386ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=0ZQRGQ+khD+Kf653Se2n50YQq2ZsgKwNNGYaxopdous=;
	b=qpULrljbIJzEA7j7m9lC485meqSA8LcJ3cXfyXxd9QQ6khs3L3Vb3sUFo7+bF8Yaju
	Kqq0Jik7hI+j0hiFzsQv3eg8Y9H3lcKpOMbQ2+fDRxXdZPBdO0SJamQJkONI2gC0DURw
	93BcjRw5330kK/lB1O8+uJYeRe7I+NYQocGJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=XwFs38paNSCsyn49ZcfwYhhtU629jH0h8SRK6EjsTPg0MfhFHNSBaFbYFHLOj3xG7P
	isBXuO95eLgY3XPuQ1C751+l2Go1e7gZ5LFYl/an5W9dwM1svx0yKJvTBnI2N/89d2/E
	xOcjHNRXQVpWxJ1bl0onswWw9k/n37yU2JMjg=
Received: by 10.14.47.8 with SMTP id s8mr267938eeb.140.1305651429343; Tue, 17
	May 2011 09:57:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Tue, 17 May 2011 09:56:35 -0700 (PDT)
In-Reply-To: <1305630665.3424.227.camel@rex>
References: <1305630665.3424.227.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2011 09:56:35 -0700
Message-ID: <BANLkTikgu6bKT603XFgpvK2b0ikroOTZhQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tom King <ka6sox@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core repo broken again
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
X-List-Received-Date: Tue, 17 May 2011 17:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 4:11 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi Guys,
>
> Something is broken with the oe-core repository as I can't push to it:
>
> $ git push origin master:master
> Counting objects: 9, done.
> Delta compression using up to 2 threads.
> Compressing objects: 100% (5/5), done.
> Writing objects: 100% (5/5), 628 bytes, done.
> Total 5 (delta 4), reused 0 (delta 0)
> remote: sed: can't read ./description: No such file or directory
> remote: *** Project description file hasn't been set
> remote: error: hook declined to update refs/heads/master
> To ssh://git@git.openembedded.org/openembedded-core
> =C2=A0! [remote rejected] master -> master (hook declined)
> error: failed to push some refs to 'ssh://git@git.openembedded.org/openem=
bedded-core'
>
>

its the same error I fixed last time. Somehow the description files in
repo got lost after melo rebooted. I have put them back
can you try and confirm if it works now ?


> Cheers,
>
> Richard
>
>


