Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RAgJf-0001HV-VX
	for openembedded-core@openembedded.org; Mon, 03 Oct 2011 13:04:12 +0200
Received: by vwe42 with SMTP id 42so2795713vwe.6
	for <openembedded-core@openembedded.org>;
	Mon, 03 Oct 2011 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=MCoY+eH0rq201Ibu0JsvMbwxkqHMTcnxRyT8JlYinQ8=;
	b=Ya7hAKtvNg/fVFnjmfv+1O6qPeHjzQW7/uuQxVwTrOl0753j58cHPjMLvzWTMo15GF
	ONoi4YlqaH2XZusLszkHLGAnhFKZIAoJVhhCX34n8bJaFCKMd9UPFB0BdFWxYWUGQE2K
	vLiP1AiWXdYhBWNbnhjVkMML0Tlbzgi5cJzB8=
MIME-Version: 1.0
Received: by 10.52.69.18 with SMTP id a18mr13167014vdu.430.1317639519265; Mon,
	03 Oct 2011 03:58:39 -0700 (PDT)
Received: by 10.52.181.226 with HTTP; Mon, 3 Oct 2011 03:58:39 -0700 (PDT)
Date: Mon, 3 Oct 2011 14:58:39 +0400
Message-ID: <CALT56yPoAbv43D_CGsGHMjr+eQxhNUJAW_Ryznoi7Tz8tb7THA@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core <openembedded-core@openembedded.org>
Subject: [RFC] .la files cleanup
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
X-List-Received-Date: Mon, 03 Oct 2011 11:04:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Proposal: extend some bbclass with a task to remove unused .la files

Rationale: There are lots of recipes, which install tons of .la files
(thanks libtool),
but then do not ship them (correctly as most of them are unused in
real systems).
My proposal would be to include a special task or a
do_install_append() part that
will remove specified .la files. (like ${libdir}/xorg/modules/*/.la,
${libdir}/matchbox-panel/*.la, etc.). I see this usually done in
do_install or in special do_install_append
parts, but I think it would be better to handle this globally.

-- 
With best wishes
Dmitry


