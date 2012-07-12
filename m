Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpLW6-0000ed-AE
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 17:41:22 +0200
Received: by ggnp4 with SMTP id p4so2362456ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 08:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to:cc
	:content-type:x-gm-message-state;
	bh=clnWUbVOJlpt2YOCSpt/81+5FAfvMu7a4wWLizpSs7Y=;
	b=F0aI8O2FaP4dXxqcl9t6PDW7NAXB+WvqtPb5piFbHaMxt8R46J0jJMxFcl2kcHDNs8
	kYspavTtRFhJaVPDat8D42axuL0/bjuvuvDq52+bFhZQZFp4u2TnQcEBgzDTmufNeA1b
	xwfyDEc3HTmtZLciZ0RbrJwUtfVWuQ7AEm6pf6oz5Byzv3lELQdPiRTht2tDIH1MYlq1
	EakHdyxcsv97fD6WNvbfl4ljpUCnl4pEZpT6dDH3o7pNWHtf/1Oej2OBheY7kNk97IeY
	mFLu7EhZw7e9PpspSkJpSk4C3MGpC8ukXV7SHMbqYS2jqQI8v85DXrBHSo0ch/nKLaIH
	Hu4w==
Received: by 10.50.94.163 with SMTP id dd3mr17626656igb.8.1342107008360; Thu,
	12 Jul 2012 08:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Thu, 12 Jul 2012 08:29:42 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 18:29:42 +0300
Message-ID: <CAK18fxF=EiFyWywDQhL=vFd1xv1J33MOwwDG8W7GJLyNZzMVVg@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlh6l3b1TgL29pxtyLQ1PcZIV1XyfYNrlwRHdDCPJZvG33Fd+LM7xsdICZ090DsFina94HT
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Results for xz compression with different -T and and -e
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
X-List-Received-Date: Thu, 12 Jul 2012 15:41:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f2357fd7bdf5304c4a3a3ec

--e89a8f2357fd7bdf5304c4a3a3ec
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hello,

Koen suggested to add -T to xz commands. We have this option implemented in
our current version .1alpha.

-T threads, --threads=3Dthreads



              Specify the number of worker threads to use.  Setting threads
to


              a special value 0 makes xz use as many threads as there are
 CPU


              cores  on  the system.  The actual number of threads can be
less


              than threads if the input file is not big enough  for
 threading


              with  the  given  settings or if using more threads would
exceed


              the memory usage limit.

-------------------

Memory: 7.8 GiB
Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4

File to compress: 1.9G

xz -f -k -e -9 --check=3Dcrc32 (current configuration)
Memory: 673Mb
real    6m37.170s
user    6m35.389s
sys     0m0.884s
Compressed file size: 3.4Mb

xz -f -k -e -9 -T 4 --check=3Dcrc32
Memory: Cannot allocate memory

xz -f -k -e -8 -T 4 --check=3Dcrc32
Memory: 1.8G
real    3m24.462s
user    12m8.502s
sys     0m2.180s
Compressed file size: 3.4Mb

xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
Memory: 471Mb
real    1m9.265s
user    4m8.972s
sys     0m0.944s
Compressed file size: 3.4Mb

So my conclusion would be to use the default -e -6 with -T 4.

@g

--e89a8f2357fd7bdf5304c4a3a3ec
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PktvZW4gc3VnZ2VzdGVkIHRvIGFk
ZCAtVCB0byB4eiBjb21tYW5kcy4gV2UgaGF2ZSB0aGlzIG9wdGlvbqBpbXBsZW1lbnRlZKBpbiBv
dXIgY3VycmVudCB2ZXJzaW9uIC4xYWxwaGEuoDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRp
dj4tVCB0aHJlYWRzLCAtLXRocmVhZHM9dGhyZWFkcyCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgoDwvZGl2PgoKCjxkaXY+oCCgIKAgoCCgIKAgoCBTcGVjaWZ5IHRoZSBudW1iZXIgb2Ygd29y
a2VyIHRocmVhZHMgdG8gdXNlLiCgU2V0dGluZyB0aHJlYWRzIHRvIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKCgPC9kaXY+CgoKPGRpdj6gIKAgoCCgIKAgoCCgIGEg
c3BlY2lhbCB2YWx1ZSAwIG1ha2VzIHh6IHVzZSBhcyBtYW55IHRocmVhZHMgYXMgdGhlcmUgYXJl
IKBDUFUgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoKA8L2Rpdj4K
Cgo8ZGl2PqAgoCCgIKAgoCCgIKAgY29yZXMgoG9uIKB0aGUgc3lzdGVtLiCgVGhlIGFjdHVhbCBu
dW1iZXIgb2YgdGhyZWFkcyBjYW4gYmUgbGVzcyCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgoDwvZGl2PgoKCjxkaXY+oCCgIKAgoCCgIKAgoCB0aGFuIHRocmVhZHMg
aWYgdGhlIGlucHV0IGZpbGUgaXMgbm90IGJpZyBlbm91Z2ggoGZvciCgdGhyZWFkaW5nIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKCgPC9kaXY+CgoKPGRpdj6gIKAg
oCCgIKAgoCCgIHdpdGggoHRoZSCgZ2l2ZW4goHNldHRpbmdzIG9yIGlmIHVzaW5nIG1vcmUgdGhy
ZWFkcyB3b3VsZCBleGNlZWQgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCg
IKAgoKA8L2Rpdj4KCgo8ZGl2PqAgoCCgIKAgoCCgIKAgdGhlIG1lbW9yeSB1c2FnZSBsaW1pdC48
L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0tLS0tLS0tLS0tLS0tLS0tLS08L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2Pk1lbW9yeTogNy44IEdpQjwvZGl2PjxkaXY+UHJvY2Vzc29yOjog
SW50ZWyuIENvcmWZIGk1LTI1NDBNIENQVSBAIDIuNjBHSHog1yA0PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj4KCkZpbGUgdG8gY29tcHJlc3M6IDEuOUc8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
Pnh6IC1mIC1rIC1lIC05IC0tY2hlY2s9Y3JjMzIgKGN1cnJlbnQgY29uZmlndXJhdGlvbik8L2Rp
dj4KPGRpdj5NZW1vcnk6IDY3M01iPC9kaXY+PGRpdj48ZGl2PnJlYWwgoCCgNm0zNy4xNzBzPC9k
aXY+PGRpdj51c2VyIKAgoDZtMzUuMzg5czwvZGl2PjxkaXY+c3lzIKAgoCAwbTAuODg0czwvZGl2
PjwvZGl2PjxkaXY+Q29tcHJlc3NlZCBmaWxlIHNpemU6IDMuNE1iPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48ZGl2Pnh6IC1mIC1rIC1lIC05IC1UIDQgLS1jaGVjaz1jcmMzMjwvZGl2PgoKPGRp
dj5NZW1vcnk6oENhbm5vdCBhbGxvY2F0ZSBtZW1vcnk8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PjxkaXY+eHogLWYgLWsgLWUgLTggLVQgNCAtLWNoZWNrPWNyYzMyPC9kaXY+PGRpdj5N
ZW1vcnk6IDEuOEc8L2Rpdj48L2Rpdj48ZGl2PjxkaXY+cmVhbCCgIKAzbTI0LjQ2MnM8L2Rpdj48
ZGl2PnVzZXIgoCCgMTJtOC41MDJzPC9kaXY+PGRpdj5zeXMgoCCgIDBtMi4xODBzPC9kaXY+Cgo8
L2Rpdj48ZGl2PkNvbXByZXNzZWQgZmlsZSBzaXplOiAzLjRNYjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGRpdj48ZGl2Pnh6IC1mIC1rIC1UIDQgLS1jaGVjaz1jcmMzMiAoLWUgZGVmYXVsdHMg
dG8gLTYpPC9kaXY+PGRpdj5NZW1vcnk6IDQ3MU1iPC9kaXY+PC9kaXY+PGRpdj48ZGl2PnJlYWwg
oCCgMW05LjI2NXM8L2Rpdj48ZGl2PnVzZXIgoCCgNG04Ljk3MnM8L2Rpdj48ZGl2PgoKc3lzIKAg
oCAwbTAuOTQ0czwvZGl2PjwvZGl2PjxkaXY+Q29tcHJlc3NlZCBmaWxlIHNpemU6IDMuNE1iPC9k
aXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5TbyBteSBjb25jbHVzaW9uIHdvdWxkIGJlIHRv
IHVzZSB0aGUgZGVmYXVsdCAtZSAtNiB3aXRoIC1UIDQuoDwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+QGc8L2Rpdj48ZGl2Pgo8L2Rpdj4K

--e89a8f2357fd7bdf5304c4a3a3ec--
