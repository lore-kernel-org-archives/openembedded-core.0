X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f0e5dc36-2447-1501-84da-862f43ed5f83@pr.hu>
Date: Sat, 6 Nov 2021 13:49:50 +0100
MIME-Version: 1.0
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: cargo-native do_fetch error
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

I tried building my custom OS rebased on current master.

I got this error:

ERROR: cargo-native-1.56.0-r0 do_fetch: No checksum specified for 
'/data/genericx86-64-yocto-3.5/downloads/rustc-1.56.0-src.tar.xz', please add at least one 
to the recipe:
SRC_URI[rust.sha256sum] = "f13468889833c88e744ad579c5d8fbb7ecb53216159b54481a90e5dcdaa9e320"
ERROR: cargo-native-1.56.0-r0 do_fetch: Bitbake Fetcher Error: NoChecksumError('Missing 
SRC_URI checksum', 'https://static.rust-lang.org/dist/rustc-1.56.0-src.tar.xz;name=rust')
ERROR: Logfile of failure stored in: 
/data/genericx86-64-yocto-3.5/tmp-sicom-glibc/work/x86_64-linux/cargo-native/1.56.0-r0/temp/log.do_fetch.3495409
ERROR: Task 
(virtual:native:/data/genericx86-64-yocto-3.5/conf/../layers/openembedded-core/meta/recipes-devtools/cargo/cargo_1.56.0.bb:do_fetch) 
failed with exit code '1'

I found no bbappend for cargo or rust in any layers I currently use
so it must be a genuine bug in Yocto 3.5 at the moment.

Best regards,
Zoltán Böszörményi
