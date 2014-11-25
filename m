Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED857210C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 20:27:57 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so1160390qcw.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 12:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=m4vkPa1z4Y4Vi053nLYJ5z36ks+1oTRQBb+XWju1nxQ=;
	b=bS7rwP/0UxM6FI/4fMsDuYmKTzRxSNida6E54T68koX0FLEHaCtAXe/mSNQtCff6pE
	cpoDPaHluwS3jhUvhOB1aktRba7FEyavblsDrFloGgkGxCHJA60oJPev7YfBgsHHqxyJ
	wpUkbF35x8pZinIwyy9HjtISNbvfbEAeVu7L3x7/IQxfE839w/TAnwlaomcbku22W47V
	CbK1tht4QBi+006tymMjLs8a+RydXH7beZRJvGePuTcHklHFXMClfiy8i0+cXVZ3/2X5
	6lSBkJMg+K+vhCRJF1aJiRkiii2f/YFSGFkJZ+g4BRWgtqsZHMq2czY2DGA1lveEhOPf
	B1qw==
X-Received: by 10.140.30.33 with SMTP id c30mr39767199qgc.32.1416947278459;
	Tue, 25 Nov 2014 12:27:58 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Tue, 25 Nov 2014 12:27:18 -0800 (PST)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 25 Nov 2014 20:27:18 +0000
X-Google-Sender-Auth: cYa7O8kz-hv1znmpSobysAPGrWc
Message-ID: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: opkg, opkg-config-base and opkg-collateral
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Nov 2014 20:28:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Does anyone know why the configuration files for opkg are split into
opkg-config-base (containing just '/etc/opkg/arch.conf') and
opkg-collateral (containing just '/etc/opkg/opkg.conf')? It looks like
the split dates back to openembedded classic.

If there isn't a good reason for this perhaps now would be a good time
to merge all this back into the 'opkg' recipe and package. I'm happy
to put the patch together, just checking if it sounds like a good idea
before I do the work.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

