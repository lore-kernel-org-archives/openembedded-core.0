Return-Path: <vygu@protonmail.ch>
X-Greylist: delayed 361 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Sep 2019 15:03:10 UTC
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
	[185.70.40.130])
	by mail.openembedded.org (Postfix) with ESMTP id EE2457C346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:03:10 +0000 (UTC)
Date: Fri, 27 Sep 2019 14:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=default; t=1569596228;
	bh=7V4V2lkkODhQ1MKiWfM8xDFvQMjXzDBQ6laNUzJkC5s=;
	h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
	b=siMH5Q5eFU5Kcn0ehc9oD9qzJTNZ4DpGshoeFZ+1mwbWN1Ja6LZ3yNIoM7ATCBgjs
	jLa8DxfKDAwYfxZ1z8nxKeEGM7AagxVe0huXYK+iy6tCtCC0vo4Dm0sEOWrc2Xp03C
	LYmxpCRXzzpD9KsZw4faA6yivMHUov2LKCsPmbdE=
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: vygu <vygu@protonmail.ch>
Reply-To: vygu <vygu@protonmail.ch>
Message-ID: <8qOLR3hEH6wWLGBdAwosadkVtTzsjACcBDJ7jxKUJKbIVJIzyXxEBy5JI-6-QtM8_w9muMkzgnnlyi-gRtTcwbvkKgfTNFYJVc2SO5GFpgY=@protonmail.ch>
Feedback-ID: zBs-L8wQuKBorWEbLVdJJa3lLTcCv3Htc-27OHD_QG0eSCsj-lmyvhEbqA6BLcl_zRuO8x5lF36uIcXEqZFTgQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Warrior, OpenCV, Python2, python-cv2 issue
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
X-List-Received-Date: Fri, 27 Sep 2019 15:03:11 -0000
Content-Type: multipart/alternative;
	boundary="b1_597fbc56ce4eea5e89c9db044cf70c08"

--b1_597fbc56ce4eea5e89c9db044cf70c08
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpXaXRoIHRoZSB3YXJyaW9yJ3Mgc2VyaWUsIHdpdGggcG9reSBhbmQgbWV0YS1vcGVu
ZW1iZWRkZWQgbGF5ZXJzLCB3ZSBoYXZlIGdvdCBhbiBpc3N1ZSBhYm91dCB0aGUgb3BlbmN2IHJl
Y2lwZSwgd2hlbiB3ZSBhZGQgdGhlICJweXRob24yIiBzdXBwb3J0IHRvIFBBQ0tBR0VDT05GSUcu
IFRoZSByZWNpcGUgZG9lcyBub3QgY3Jhc2guIEJ1dCB0aGUgaXNzdWUgaGFwcGVucyBkdXJpbmcg
dGhlIHJvb3RmcyBnZW5lcmF0aW9uLCBiZWNhdXNlICJub3RoaW5nIHByb3ZpZGVzIHB5dGhvbi1v
cGVuY3YgbmVlZGVkIGJ5IG9wZW5jdi0zLjQuNS1yMCIuIFRoZSBvcGVuY3YgcmVjaXBlIGRvZXMg
bm90IHNlZW0gdG8gcHJvdmlkZSBjb3JyZWN0bHkgdGhlIHB5dGhvbi1jdjIgcGFja2FnZSBkdWUg
dG8gdGhlIFBZVEhPTl9TSVRFUEFDS0FHRVNfRElSIHZhcmlhYmxlIGRlZmluaXRpb24uCgpIb3cg
Y2FuIHdlIG9idGFpbiBvbiBvdXIgaW1hZ2UgcHl0aG9uLWN2MiBhbmQgcHl0aG9uMy1jdjIgd2l0
aCB0aGUgb3BlbmN2IHJlY2lwZT8KVGhhbmsgeW91IGluIGFkdmFuY2UuCgpWeWd1


--b1_597fbc56ce4eea5e89c9db044cf70c08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaXRoIHRoZSB3YXJyaW9y
J3Mgc2VyaWUsIHdpdGggcG9reSBhbmQgbWV0YS1vcGVuZW1iZWRkZWQgbGF5ZXJzLCB3ZSBoYXZl
IGdvdCBhbiBpc3N1ZSBhYm91dCB0aGUgb3BlbmN2IHJlY2lwZSwgd2hlbiB3ZSBhZGQgdGhlICJw
eXRob24yIiBzdXBwb3J0IHRvIFBBQ0tBR0VDT05GSUcuIFRoZSByZWNpcGUgZG9lcyBub3QgY3Jh
c2guIEJ1dCB0aGUgaXNzdWUgaGFwcGVucyBkdXJpbmcgdGhlIHJvb3RmcyBnZW5lcmF0aW9uLCBi
ZWNhdXNlICJub3RoaW5nIHByb3ZpZGVzIHB5dGhvbi1vcGVuY3YgbmVlZGVkIGJ5IG9wZW5jdi0z
LjQuNS1yMCIuIFRoZSBvcGVuY3YgcmVjaXBlIGRvZXMgbm90IHNlZW0gdG8gcHJvdmlkZSBjb3Jy
ZWN0bHkgdGhlIHB5dGhvbi1jdjIgcGFja2FnZSBkdWUgdG8gdGhlIFBZVEhPTl9TSVRFUEFDS0FH
RVNfRElSIHZhcmlhYmxlIGRlZmluaXRpb24uPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
SG93IGNhbiB3ZSBvYnRhaW4gb24gb3VyIGltYWdlIHB5dGhvbi1jdjIgYW5kIHB5dGhvbjMtY3Yy
IHdpdGggdGhlIG9wZW5jdiByZWNpcGU/IDxicj48L2Rpdj48ZGl2PlRoYW5rIHlvdSBpbiBhZHZh
bmNlLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlZ5Z3U8YnI+PC9kaXY+PGRpdj48YnI+
PC9kaXY+



--b1_597fbc56ce4eea5e89c9db044cf70c08--
