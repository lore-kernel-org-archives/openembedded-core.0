Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T6GYp-0006Zs-Ej
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 09:50:07 +0200
Received: by iaky10 with SMTP id y10so10310802iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=A3QiJrLeApZKE4Uw3f/P7snIDYZU9d//VNwcPylyU6w=;
	b=MWqLzvB++AB8yidLHCFpHwOY7VRowHbF9KiI79szrATkxbMVSgcKcwS364yjN/Zswr
	JV0RyuIyvt3dbXhPAFh5j5CNKLxZfTSs1Vbc3PMqaaxaowYvQauAk9u1Np1rhlWdTNV2
	OPBaHEKV5BJrt2oTCNBEVAa5FSwhGMpZ0W8nmwXF/QIfheE0H4rCdfLt6VwYC215zMGm
	u2YN38otsNhRmyHYYZ8097u99w7SyrjSfCkQINLrhYcp630N+GU5ZOBg2GpCElObsXdE
	e8PkXJA2neMlYAhyhbCp9hmHiSZ/FNamjQl8oDIePFp7dk+BQaXK8ue/AGC+JNHaLhm/
	piKw==
MIME-Version: 1.0
Received: by 10.43.45.200 with SMTP id ul8mr13026869icb.36.1346139474396; Tue,
	28 Aug 2012 00:37:54 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Tue, 28 Aug 2012 00:37:53 -0700 (PDT)
Date: Tue, 28 Aug 2012 09:37:53 +0200
Message-ID: <CAGiJk9dvZ=_eSZwcXRnsfwo+h0x9fWJnCapuSCVz_HftgJAw6g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Package re-order fallouts?
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
X-List-Received-Date: Tue, 28 Aug 2012 07:50:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

after switching from the Denzil branch to next it seems that the
package order has been changed.
This causes failures with non symlink .so files in -dev packages for
various meta-kde recipes.

What is the preferred way to fix this?
Currently done something like: unset FILES_SOLIBSDEV and add all
dev-libs by hand (there must be a better way to fix this).


-- 
Regards
Samuel


