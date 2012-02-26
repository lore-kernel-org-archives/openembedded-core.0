Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S1hyR-0008P4-MQ
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 18:33:27 +0100
Received: by obhx4 with SMTP id x4so4785305obh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 09:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.1.104 as permitted sender) client-ip=10.182.1.104; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.1.104 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.1.104])
	by 10.182.1.104 with SMTP id 8mr3917272obl.19.1330277101904 (num_hops =
	1); Sun, 26 Feb 2012 09:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yt2zWGqyxZosRGHanHgeOPFCfFvU+ybuBzIzSLdwNvs=;
	b=o6wFk2tPVyR7+kCIWbSYENN2Ts/In6Qna9f+VVyxQBYj3buBJ7Yas84oM0RD27prfG
	xubqKlYmhloGdBVQ0WablVEQfsRaHT/TJoskNRNIE6kgGELwhsnLozAWdvEKz4vN0mUJ
	orgui0K6gzfmu9HwqoYqfG7eX3jFyjdYvOkck=
MIME-Version: 1.0
Received: by 10.182.1.104 with SMTP id 8mr3500617obl.19.1330277101841; Sun, 26
	Feb 2012 09:25:01 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Sun, 26 Feb 2012 09:25:01 -0800 (PST)
Date: Sun, 26 Feb 2012 09:25:01 -0800
Message-ID: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: elfutils - missing dependency on bzip2?
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
X-List-Received-Date: Sun, 26 Feb 2012 17:33:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

After a pull this morning the rebuild if elfutils fails with:

| /usr/bin/ld: cannot find -lbz2
| collect2: ld returned 1 exit status
| make[3]: *** [libdw.so] Error 1
| make[3]: Leaving directory
`/media/Work/yocto/tmp/work/i686-linux/elfutils-native-0.148-r5/elfutils-0.148/libdw'

If I build bzip2-native and then rebuild elfutils-native all is well
and the build continues until the next failure (mesa-dri-glsl-native,
fwiw, haven't investigated that one yet).

Anyone else see this, or is it just another case of my build machines
being in a strange state?

Steve


