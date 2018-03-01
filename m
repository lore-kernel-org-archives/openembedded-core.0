Return-Path: <ruslan@babayev.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4A46E700F3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 01:53:35 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id 61-v6so2724665plf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=G9g7JiFL6I9U4+AlcO8Q/4G3gnMPVHiEvGkoZ69kn0U=;
	b=YTAJQkh5CuCKc0AeyJyXjOgzxG4oO8hhm00vz5zDOYOZYj1NLb4bfk5E/WKHV1OuDr
	i4RBKe2yHeVxsqIYtKyE3Rrz5rF7n/SJASy9ABWlUTulhj/Id+jSjnt1g9YD+Z614t8Q
	Fzp2g6qz+WpjepVDLWAWgnEzSJpdcaGgf5RrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=G9g7JiFL6I9U4+AlcO8Q/4G3gnMPVHiEvGkoZ69kn0U=;
	b=jrlhyxueEWc28blqwJVnFSgtnaBRjL15Gs3vSXhucU2CPEzy9/c8A4o3tze96cqB1B
	qQR4Ohb5r/Twwm5T1OyyuBVnyqyzbWFbHiKSTJ9n/ZynYpQMp6YUhewhDLdnjpYQozfU
	AaVJKu5jYUMD7xdSChj5YfDU2x1DUuDgpb6NNMwpsqwzrkP8Ko86vvxFgfh1r/QB9ioQ
	diKDtgUbzx8A6mjtItyiGHDbTpERq/d2Wv9akM6Lq36sgtOYekIz4uJQ/5ZQxzcZOoMJ
	V5yg1I8Q4/lBR4SIPhFu27aD0SZCRYVThdD8YdP0G3IK1ls8j/SxvicH+/t0LbgNyXJ+
	395w==
X-Gm-Message-State: APf1xPDaNe44/QEIHcFHKsO0Kv0s6rA4TJn6OgiKbd/A0Ho8TFmpq9EE
	apYJF5UsSr8zxJqKWPodGpb75+YFZ73FB4N9H55D4PrX
X-Google-Smtp-Source: AG47ELt/AjvICK+eCXnaeVFrVB4u43D/wvLA0IaSYWGbCdJKZ6zfOsEnYpXsa5gQQ9smUIjytvzNSUW56ALHNdOtreo=
X-Received: by 2002:a17:902:1c5:: with SMTP id
	b63-v6mr180093plb.311.1519869217051; 
	Wed, 28 Feb 2018 17:53:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.236.185.131 with HTTP; Wed, 28 Feb 2018 17:53:36 -0800 (PST)
From: Ruslan Babayev <ruslan@babayev.com>
Date: Wed, 28 Feb 2018 17:53:36 -0800
Message-ID: <CAOpYhv9DYb5wkmw9ZN+xH751t4PQwK3tybLdoDPeQQX-Qzmneg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: tune-octeon: change Octeon II to soft-float
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
X-List-Received-Date: Thu, 01 Mar 2018 01:53:36 -0000
X-Groupsio-MsgNum: 108585
Content-Type: multipart/mixed; boundary="000000000000c9d270056650208f"

--000000000000c9d270056650208f
Content-Type: text/plain; charset="UTF-8"



--000000000000c9d270056650208f
Content-Type: application/octet-stream; 
	name="0001-tune-octeon-change-Octeon-II-to-soft-float.patch"
Content-Disposition: attachment; 
	filename="0001-tune-octeon-change-Octeon-II-to-soft-float.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_je7uvlt90

RnJvbSAzNDgzMzI2MjNlMTZiZDFjNjY2ZWFmZGVjMmFkZjM1MGI5ZDY0NzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSdXNsYW4gQmFiYXlldiA8cnVzbGFuQGJhYmF5ZXYuY29tPgpE
YXRlOiBUdWUsIDI3IEZlYiAyMDE4IDA0OjIyOjQ3IC0wODAwClN1YmplY3Q6IFtQQVRDSF0gdHVu
ZS1vY3Rlb246IGNoYW5nZSBPY3Rlb24gSUkgdG8gc29mdC1mbG9hdAoKT2N0ZW9uIElJIFNPQ3Mg
ZG9uJ3QgaGF2ZSBGUFVzCgpTaWduZWQtb2ZmLWJ5OiBSdXNsYW4gQmFiYXlldiA8cnVzbGFuQGJh
YmF5ZXYuY29tPgotLS0KIG1ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvdHVuZS1vY3Rlb24uaW5j
IHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3R1bmUtb2N0ZW9u
LmluYyBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvdHVuZS1vY3Rlb24uaW5jCmluZGV4IGI1
ZGViOGYuLjNmYWJkMDIgMTAwNjQ0Ci0tLSBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvdHVu
ZS1vY3Rlb24uaW5jCisrKyBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvdHVuZS1vY3Rlb24u
aW5jCkBAIC03LDE1ICs3LDE1IEBAIEFWQUlMVFVORVMgKz0gIm9jdGVvbjIgb2N0ZW9uMl82NCBv
Y3Rlb24zIG9jdGVvbjNfNjQiCiBUVU5FVkFMSURbb2N0ZW9uMl0gPSAiRW5hYmxlIG9wdGltaXph
dGlvbiByZWxhdGVkIHRvIG9jdGVvbjIgc3VwcG9ydCIKIFRVTkVfQ0NBUkdTIC49ICIke0BiYi51
dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsICdvY3Rlb24yJywgJyAtbWFyY2g9b2N0ZW9u
MiAnLCAnJyxkKX0iCiAKLVRVTkVfRkVBVFVSRVNfdHVuZS1vY3Rlb24yID0gIiR7VFVORV9GRUFU
VVJFU190dW5lLW1pcHM2NC1uMzJ9IG9jdGVvbjIiCitUVU5FX0ZFQVRVUkVTX3R1bmUtb2N0ZW9u
MiA9ICIke1RVTkVfRkVBVFVSRVNfdHVuZS1taXBzNjQtbmYtbjMyfSBvY3Rlb24yIgogQkFTRV9M
SUJfdHVuZS1vY3Rlb24yID0gImxpYjMyIgogTUlQU1BLR1NGWF9WQVJJQU5UX3R1bmUtb2N0ZW9u
MiA9ICJvY3Rlb24yIgotUEFDS0FHRV9FWFRSQV9BUkNIU190dW5lLW9jdGVvbjIgPSAibWlwczY0
LW4zMiBvY3Rlb24yLW4zMiIKK1BBQ0tBR0VfRVhUUkFfQVJDSFNfdHVuZS1vY3Rlb24yID0gIm1p
cHM2NC1uZi1uMzIgb2N0ZW9uMi1uMzItbmYiCiAKLVRVTkVfRkVBVFVSRVNfdHVuZS1vY3Rlb24y
XzY0ID0gIiR7VFVORV9GRUFUVVJFU190dW5lLW1pcHM2NH0gb2N0ZW9uMiIKK1RVTkVfRkVBVFVS
RVNfdHVuZS1vY3Rlb24yXzY0ID0gIiR7VFVORV9GRUFUVVJFU190dW5lLW1pcHM2NC1uZn0gb2N0
ZW9uMiIKIEJBU0VfTElCX3R1bmUtb2N0ZW9uMl82NCA9ICJsaWI2NCIKIE1JUFNQS0dTRlhfVkFS
SUFOVF90dW5lLW9jdGVvbjJfNjQgPSAib2N0ZW9uMl82NCIKLVBBQ0tBR0VfRVhUUkFfQVJDSFNf
dHVuZS1vY3Rlb24yXzY0ID0gIm1pcHM2NCBvY3Rlb24yXzY0IgorUEFDS0FHRV9FWFRSQV9BUkNI
U190dW5lLW9jdGVvbjJfNjQgPSAibWlwczY0LW5mIG9jdGVvbjJfNjQtbmYiCiAKIAogVFVORVZB
TElEW29jdGVvbjNdID0gIkVuYWJsZSBvcHRpbWl6YXRpb24gcmVsYXRlZCB0byBvY3Rlb24zIHN1
cHBvcnQiCi0tIAoyLjcuNAoK

--000000000000c9d270056650208f--
