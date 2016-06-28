Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB757319C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 22:53:24 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id v199so157983017wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=TJunRojZk9mnop0chc8n9uZRxQL2/kjHxxyGcVub0Ho=;
	b=mKlfd5nzNSFcHRz1mbtTdumU5dH3Q3Y0KpbucJXSyeMqvPle5mO/3AzpVE5FveI3OA
	Diu9Fhh+e47af9U6tEyKyMz9rAwaqagPOsEFKqllVfcw1sGaado4XKR/piYGCOIzdhTz
	nLTnB1Ssd4Bz/2YjE1weRTzPjQnq1LxwxpksDxnYtf07sQ5ZJLe6Lsj/1+jKP6TJPNI7
	DIr7UBlvLnyH4QX9nS1P2RoGWp94pmOKZON+xsGTa5gOhlkW2Gs+HPGmASAl1edfHCoE
	aC0KRctp4qlxnSSjZGUE/j/TF22mnaZlzspwPBeI9FiNwQDq6VJSG3R6I2lYqmrcU0Bm
	kbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=TJunRojZk9mnop0chc8n9uZRxQL2/kjHxxyGcVub0Ho=;
	b=ZY0gRV1qkkL8KqbWkWyO5ptCgecQn3OfVdwrEMuPD0oCEpkj1hDO2ZfWw6hobKBkrY
	qmOp3+FagT4mjPjCXhBLQGovPLFfM+VvtDFsFr36BSEI36WqItpQaPcu2OQSmHKPOWbE
	thh3hWVf/na/uT8Aawfb2dtFONyZpMeGQRAGmLNOJfzz9DBGBEyWD6OwhiVpK/qd9ZFl
	YX4xfWeZt0mFYaUudJCKswfeABcWusALWCyPxjP9tmy5l/QYKi1YQViewTtEFSZborV/
	QvhqaONzsTor/g16SrXDQXYEDc7ZRvUtu6+tcShBOmo3sBqMyehT65y553Xb0U3NtnXj
	HxaA==
X-Gm-Message-State: ALyK8tICNspw3wL/wdxD1AiXBfDbMOVyM2sPP8pBUwu8Fl1osYpsNtLnuYtdVw/ilJl1VYebxJ0OxxI9XK6/Sg==
X-Received: by 10.28.225.196 with SMTP id y187mr17554418wmg.72.1467154405048; 
	Tue, 28 Jun 2016 15:53:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Tue, 28 Jun 2016 15:53:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Jun 2016 15:53:24 -0700
Message-ID: <CAJ86T=UX4mrrftUtmnFX=Gv5JHXr0nFbh+qj7JOxbxFnKcfT9w@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Setting SRC_URI via anonymous Python fails in OE 2.1
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
X-List-Received-Date: Tue, 28 Jun 2016 22:53:25 -0000
Content-Type: text/plain; charset=UTF-8

The following works in OE 2.0, but fails in 2.1 and master:

  python () {
      d.setVar("SRC_URI_FOO", "http://foo.com/foo.tgz")
  }

  SRC_URI = "${SRC_URI_FOO}"


Is it a regression or was something like that never intended to work?

