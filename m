Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 121487FCEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:31:10 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id l136so8235404oig.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 05:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4N8ptbBjKmh4vUDUEkXk2BpAtYJCpRY0V+ooMt/p5e0=;
	b=qWiZQkOC6qA3KhIA/fr9iRC0Ymv0lyAvPj80+hqRUdcTP4txqHRVNOelt0q8j9VJ5f
	DIUDFdmWhyCWF0e4JgJ0pdypxM0QJF3lhHGji1mhX9XPQtDtUALLmgp+SjAMBn5lB3YU
	Yut08mQCqkx7P1IqzvR/Zr1TXsiK5N6lFItUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4N8ptbBjKmh4vUDUEkXk2BpAtYJCpRY0V+ooMt/p5e0=;
	b=XHa3sA0iPRr+jmaQqUCoAEQS4ivr2SzZX98Na2avQG7qIhxNNXFHUEZMdo2+47Tcye
	FupRqN9j9bDbyahg4NMGUgmGf5VGDOWIoeSJY4MOQaAD9uxKuLN2WPHxonaDXITYRXH2
	7XNd7oEP4VolXn8RwgrmdxRefRyG9P5gjOag816Q4aSH3Z/VzVvR40Gh1Re9UutBLlGf
	usOggQG7YBOK91JG3VLko1rVgpqx5g6/BaLOOTzzvDjKyfdK6vSEgzMGsi0MOv8nCCzA
	sm+0C/iSdhLeaO9lkb6AUQ5cWqwK/BmgNOMwrPqRM4So0yCHW0fZR8i4+wbXfOgnH+JX
	kUaQ==
X-Gm-Message-State: APjAAAVAgUlhXxD8v2GAq1GmIKDrlcacMoj64NubpJKhOZo+sRoLlXdm
	D9psjGdo4Pceuxe2qBeTWKLEQF9Dj5WctuMRScYDTA==
X-Google-Smtp-Source: APXvYqxIKK2j9/B3NoiP3fYWoT6/9o8nte5ETDSn/qzcwyrcEX/roVVx0EexqmcXklwjwKJabHcUw4DMjPyaxAWsYY4=
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr12708883oiy.27.1578922272023; 
	Mon, 13 Jan 2020 05:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
In-Reply-To: <20200113130827.7409-1-maxim.uvarov@linaro.org>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 13 Jan 2020 13:31:02 +0000
Message-ID: <CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] wic: fix images build in parallel
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
X-List-Received-Date: Mon, 13 Jan 2020 13:31:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> OE wic plugins create temporary file with the index of the line
> tmp file name. This causes race in case several builds run in time.
> Add more entropy as timestamp to remove this race.

How would two wic images to be built in parallel with the same work
directory? To my understanding an image recipe only supports building
a single wic image.

Thanks,
Paul

