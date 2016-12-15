Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 954E477248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 19:33:28 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id n6so67194332qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 11:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LV/a8NchpcS7nAo9OULNBjl9OSoGFmLTrjnAz5YDlSQ=;
	b=FvytB6OXUymXYr7ylR6JPb+ixuc1AdZjpmrdwrnKB1Vw15bGkkGyKOLsvbOyh5DQee
	YMT46zEctICgxPPHaseSOR8a7uTBebRF7zqgBMLnE7+bSkmAtOYceZ/fJOTqnStFmwG6
	A71aXMI/DtLSeeGMkhQnCf8F75gw3bZFfjHUR7kQ58ZzKttcf528cATuGcP+xUtUkVdP
	3lp0zLkfyJ8dccgvDewGByZIrDuvGqiZASbMmijMmS/FXE3OUmBi43siT2TKWWP1pPg1
	nKjNPWa0Pxx07AlENr1bJLrt1qt6KkrhP4R5mpXAV0BFhYAcBBwEzXwclNBsf4V3wor+
	fkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LV/a8NchpcS7nAo9OULNBjl9OSoGFmLTrjnAz5YDlSQ=;
	b=iZkPGBNAEeRzFRJwHsv2JOqHWPTauVQ8LDZ54iIR4QdXNSoXErLbwXct/GMjwaVa7C
	uHps15NX0PhLKCXKiIxHvAzSj/hM64+31daFUxNoVxFSdiKEpvg4D+1NHfrqcEawYdnw
	8MDO7u2ZpFbAloiY7tv9K/wSAUM+kptaVUGb1+y8iOy7PQTXIIRFnPHFgAe5LOnypANr
	jX9HowlgJzCRGadhojs92L6Qz6nmNZF0KGdISkGCYYJRb16MJ95QXosDZGhqzLOvJPoA
	/lC7n6lvLld8Vzz5BEeNfy1C9Qv9kEppNQnTrRcbJqWtNJdr7C84UWY422lkP/Tx1RLG
	8GeA==
X-Gm-Message-State: AIkVDXITZXIKwkeJcxS+3K7Qo/l1/dOfTfJcDYd8wLSSwS/xqaOkpD4kwocMPXfGi8Le3yiWqkSkSje8cFv71l6W
X-Received: by 10.237.44.161 with SMTP id g30mr1962737qtd.144.1481830409419;
	Thu, 15 Dec 2016 11:33:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 15 Dec 2016 11:33:09 -0800 (PST)
In-Reply-To: <c5a2e55512d944e0855c7dd2658ad256@svr-ies-mbx-01.mgc.mentorg.com>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
	<1481548821-15878-2-git-send-email-andrej.valek@siemens.com>
	<c5a2e55512d944e0855c7dd2658ad256@svr-ies-mbx-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Dec 2016 19:33:09 +0000
Message-ID: <CAJTo0LbAgwJbNpiONVMP_udObfJMBhCs5SPS7so+073MjtYKTA@mail.gmail.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libxml2: fix CVE-2016-4658 Disallow namespace nodes in XPointer points and ranges
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
X-List-Received-Date: Thu, 15 Dec 2016 19:33:28 -0000
Content-Type: multipart/alternative; boundary=94eb2c1258482bd6350543b78799

--94eb2c1258482bd6350543b78799
Content-Type: text/plain; charset=UTF-8

On 15 December 2016 at 19:05, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:

> Can we merge this on morty branch as well?
>

Yes, if you ping the morty maintainer.

Ross

--94eb2c1258482bd6350543b78799
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 December 2016 at 19:05, Ahsan, Noor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Noor_Ahsan@mentor.com" target=3D"_blank">Noor_Ahsan@mentor.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8gv" class=
=3D"a3s aXjCH m15903e09b57729ae">Can we merge this on morty branch as well?=
<br></div></blockquote></div><br>Yes, if you ping the morty maintainer.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--94eb2c1258482bd6350543b78799--
