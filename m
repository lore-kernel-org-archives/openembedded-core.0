Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SZMjP-0004Nt-3Q
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 15:45:03 +0200
Received: by yenl13 with SMTP id l13so2056840yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1TxFSkaKiRU+uXwtu1EPouRzsH2oUNUlxhaoA5nAYng=;
	b=HuMEGvR8zADZ26KvCYrsRjPlKsDRKLkDizvcbQ8wOaWERAvFa6JDuvoYhSTYmxoyF6
	nJMWrVZjNouz1UTkSaVS0qwpwfzar5fyX25AziC6HCJWovzKoyLaItUntTqHFcPUMuu2
	6jGbp1EzRpqzmUZWLLUPO4uyzXaeWIUYrU7q+BIYb3ZU9JHD+hpnrILEpsatWAULyaRh
	THQ14vY9i0hkK9S8IILqQPjgZ1kwk/WnquSlW607nYqu/Ge3Md3gsD+Okyk5abN39UXC
	v6rcOp+en/3B1puzN655KTdJz0YZf/XFQ4aIZHMJw4tv/J1enbHOlA0qqLgiHtpj+oZU
	ESIw==
MIME-Version: 1.0
Received: by 10.50.202.100 with SMTP id kh4mr7252948igc.43.1338298485023; Tue,
	29 May 2012 06:34:45 -0700 (PDT)
Received: by 10.231.238.69 with HTTP; Tue, 29 May 2012 06:34:45 -0700 (PDT)
Date: Tue, 29 May 2012 15:34:45 +0200
Message-ID: <CAOHjBZsu5p39dMujfjoHuz_twU1ZrJ+HZTsbnEEb9X=J=7bnFw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: core-image-minimal do_rootfs issue (?)
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
X-List-Received-Date: Tue, 29 May 2012 13:45:03 -0000
Content-Type: multipart/alternative; boundary=f46d04478855cda22004c12ce52c

--f46d04478855cda22004c12ce52c
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

building the default core-image-minimal image I obtain no error and all
seems to end right.
But if I look at the generated .../tmp/log.do_rootfs file I can see an
error that souds strange to me.
-------
Building feeds for
[stlinux]..
./

./lib/

./lib/librt-0.9.32.so

./lib/libusb-1.0.so.0

./lib/libtinfo.so.5

./lib/libtinfo.so.5.9

./lib/ld-uClibc.so.lds

./lib/libc.so.0

./lib/libgcc_s.so.1

./lib/libusb-0.1.so.4.4.4
[snip]

Error: min I/O unit was not specified (use -h for help)
-------
I can understand it is a warning that highlight no devices are created in
that rootfs.
Are we sure the build ends right after this error/warning?
This is the last debug info the log.do_rootfs provides and at the end the
build ends with no errors.
Is it true?

Best Regards,
Giuseppe

--f46d04478855cda22004c12ce52c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPC9kaXY+PGRpdj6gPC9kaXY+PGRpdj5idWlsZGluZyB0aGUgZGVmYXVsdCBj
b3JlLWltYWdlLW1pbmltYWwgaW1hZ2UgSSBvYnRhaW4gbm8gZXJyb3IgYW5kIGFsbCBzZWVtcyB0
byBlbmQgcmlnaHQuPC9kaXY+PGRpdj5CdXQgaWYgSSBsb29rIGF0IHRoZSBnZW5lcmF0ZWQgLi4u
L3RtcC9sb2cuZG9fcm9vdGZzIGZpbGUgSSBjYW4gc2VlIGFuIGVycm9yIHRoYXQgc291ZHMgc3Ry
YW5nZSB0byBtZS48L2Rpdj4KPGRpdj4tLS0tLS0tPC9kaXY+PGRpdj5CdWlsZGluZyBmZWVkcyBm
b3IgW3N0bGludXhdLi6goKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgIDxicj4uL6CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIDxicj4uL2xpYi+goKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgIDxicj4KLi9saWIvPGEgaHJlZj0iaHR0cDovL2xpYnJ0LTAuOS4zMi5zbyI+bGlicnQtMC45
LjMyLnNvPC9hPqCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKAgPGJyPi4vbGliL2xpYnVzYi0xLjAuc28uMKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKAgPGJyPi4vbGliL2xpYnRpbmZv
LnNvLjWgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKAgPGJyPgouL2xpYi9saWJ0aW5mby5zby41LjmgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIDxicj4uL2xpYi9sZC11Q2xpYmMu
c28ubGRzoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgIDxicj4uL2xpYi9saWJjLnNvLjCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgIDxicj4KLi9saWIvbGliZ2NjX3Muc28u
MaCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCg
oKCgoCA8YnI+Li9saWIvbGlidXNiLTAuMS5zby40LjQuNDxicj48L2Rpdj48ZGl2PltzbmlwXTwv
ZGl2PjxkaXY+oDwvZGl2PjxkaXY+RXJyb3I6IG1pbiBJL08gdW5pdCB3YXMgbm90IHNwZWNpZmll
ZCAodXNlIC1oIGZvciBoZWxwKTwvZGl2PjxkaXY+LS0tLS0tLTwvZGl2Pgo8ZGl2PkkgY2FuIHVu
ZGVyc3RhbmQgaXQgaXMgYSB3YXJuaW5nIHRoYXQgaGlnaGxpZ2h0IG5vIGRldmljZXMgYXJlIGNy
ZWF0ZWSgaW4gdGhhdCByb290ZnMuPC9kaXY+PGRpdj5BcmWgd2Ugc3VyZSB0aGUgYnVpbGQgZW5k
cyByaWdodCBhZnRlciB0aGlzIGVycm9yL3dhcm5pbmc/oDwvZGl2PjxkaXY+VGhpcyBpcyB0aGUg
bGFzdCBkZWJ1ZyBpbmZvIHRoZSBsb2cuZG9fcm9vdGZzIHByb3ZpZGVzIGFuZCBhdCB0aGUgZW5k
IHRoZSBidWlsZKBlbmRzIHdpdGggbm8gZXJyb3JzLjwvZGl2Pgo8ZGl2PklzIGl0IHRydWU/PC9k
aXY+PGRpdj6gPC9kaXY+PGRpdj5CZXN0IFJlZ2FyZHMsPC9kaXY+PGRpdj5HaXVzZXBwZTwvZGl2
PjxkaXY+oDwvZGl2Pgo=

--f46d04478855cda22004c12ce52c--
