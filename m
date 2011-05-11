Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QK8iM-0005nc-6w
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 14:40:30 +0200
Received: by bwz5 with SMTP id 5so401567bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=K2B6WZPDMeXz3c2k8sg1K5XMl3azptRnhv1rzhmf5Rs=;
	b=goIFzskQXFcK3YZeyeB2SXWMcJfIBSgB+0rqbWNn3QP2BE/w20yxAPKIH8Tgzd6Jo5
	jhnSpd/RVHkZJgzTJJ7XH0AK7C5Tonhi877bcT1oxAlQ5qCC/YB4Y5FBDKPfeOp4PhYy
	TXvLqLvGVu6+0sFCkWSyD8d9HB0AV5O/IYl+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=GfLBaapjLyZGXnBTW/RtlAT7i3OyGm4HltV8swr2dyRIIHiscnGRVvxYEhCfrGg/MF
	ej3OIJEDWkXNTKMHH6NN+dF++qXuyXNAfk3tXStu4wS2hHIZJK679yc7q1XJKc3vQZaZ
	gUB6qrhlkdg/rMW07Mi+dd8VASH8nktwKJiSQ=
MIME-Version: 1.0
Received: by 10.204.126.38 with SMTP id a38mr5328797bks.195.1305117463344;
	Wed, 11 May 2011 05:37:43 -0700 (PDT)
Received: by 10.204.115.146 with HTTP; Wed, 11 May 2011 05:37:42 -0700 (PDT)
Date: Wed, 11 May 2011 14:37:42 +0200
Message-ID: <BANLkTik-WKWNkvyLtvh-CEtD2e4qa8EcGQ@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: How does openembedded-core-contrib/master relate to openembedded-core/master?
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
X-List-Received-Date: Wed, 11 May 2011 12:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

how does the master branch of openembedded-core-contrib relate to the
master branch of openembedded-core?

Is -core-contrib tracking -core 1-to-1?

The reason I ask is that user contribution go into feature branches
(name/feature) of -core-contrib, but should ideally be based against
core itself, as RP pulls there, and we want clean pulls.

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/
http://git.openembedded.org/cgit.cgi/openembedded-core/log/

My first feature branch (likewise/gnuspe) was cloned from, branched,
and pushes against openembedded-core-contrib, is that the correct
approach?

Regards,
-- 
Leon


