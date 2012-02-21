Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1Rzv4Z-0002aS-Lh
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:08:24 +0100
Received: by obhx4 with SMTP id x4so9356558obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 11:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.60.4.105 as permitted sender) client-ip=10.60.4.105; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.60.4.105 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.60.4.105])
	by 10.60.4.105 with SMTP id j9mr13224162oej.29.1329850803538 (num_hops
	= 1); Tue, 21 Feb 2012 11:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GvpLsvUNNn3iEh6iW7MIrLQD/dZkssxXsFW0SXJgegg=;
	b=kkEh+OkKJMA41bf2/4pYOsYDSloejJFM7J8zxqxaZynytbzJ8dKfIWGLQUMdZ9y+CQ
	7Fc0EiWbSMLZgrngj5XagOkZp9vpddR+C24ejb9Cy3wmiAMWYl5wZ85opKHXHsM4ciOa
	NxvO+OWANKRq8o+KrKenkjs+bcJ3loVhoxF/w=
MIME-Version: 1.0
Received: by 10.60.4.105 with SMTP id j9mr11331885oej.29.1329850803471; Tue,
	21 Feb 2012 11:00:03 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 21 Feb 2012 11:00:03 -0800 (PST)
In-Reply-To: <4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
Date: Tue, 21 Feb 2012 11:00:03 -0800
Message-ID: <CAGDS+n==tWU5kAgqVUgUSm-S3-nQN+XBHgmxAqyues2E+fs2aA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
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
X-List-Received-Date: Tue, 21 Feb 2012 19:08:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 7:40 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
<snip>

> =A0meta/recipes-core/libxml/libxml2_2.7.8.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-

The rebuild of libxml2 triggered by this commit fails on my 8 core machine:

| In file included from libxml.h:36:0,
|                  from xmlmemory.c:8:
| ./include/libxml/xmlversion.h:396:22: fatal error: ansidecl.h: No
such file or directory

Seems to be a missing dependency on binutils.  I'll send a patch.

Steve


