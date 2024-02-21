Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF33C54788
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:45:13 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.4720.1708483507964162098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IsnTbEuk;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7876f2a2e62so112024585a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483507; x=1709088307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc7etFmaS+//yIC4TX6RDyXMEmlKfp9Fl7C7tFZ60WM=;
        b=IsnTbEukHZg+AoRxcOTKYOhGpKWS3a9eF1kd8PY/zZURNX60AjDsmM0WmjMMwnuCBT
         i9Ip3zqUIwcbTOqPOAvb37aoIsXbyE5n527V5czRb7yBoOAAC+YuHuMjw8gswr8RLHOq
         3JRI48M1Wek59IldstzSpHtKRhZB9mHRCnmTaSvdsOlTDq12pDVsYMadRYfvGKLMUkM5
         1zLCTXx0kyK+6l5XSt0GDPSqjn5fw1Z1VzR28FJ7bOQphYQbbSzofZX4EeJyDG4HKOR2
         z362FmpzSiNFM6FnyG7dyyLo1bYi5RrJFZHG2+ZVDqqEmsAbZ+BJ0MI5pQtn3wYXppRJ
         rWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483507; x=1709088307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yc7etFmaS+//yIC4TX6RDyXMEmlKfp9Fl7C7tFZ60WM=;
        b=NVd6jwM8vSFUtsHvodI499ra6faBt7ys9KQPK9VxWjujErHRDoGKtcqP18Sii04jOM
         0eCEZnIU1KZCgKBcLwp5S4ydWiOhHMHEsZNcjVjT64pR1cytRAVmkceTVqW3q+NMZYXO
         kWE22bTi/TkaucyTj8AEvtUpEL+I5Gr+ZwIdaQ21QGV3JfndKuUa8jnKkOc3BR1T7rhP
         VE4DksvqeVuvkafU14cwtCapCpkuEPNLL4RCiNQxSxaKRNjIWHuPqmabm1Qc6cfa7vJF
         MgeQooPy7VOtj8GA1hf56BYGjLyAT3fdZHPzBviA2I9xCQrdMv10K6IxU5D6eoyl40gT
         ie7A==
X-Gm-Message-State: AOJu0YwcCchvLmoD0/H02FOwUh1fJcQ6vseUzje8j7vNoOz3phN/ObHx
	+i0SiS9tdf7A9CxALjtONDXqBK4wOT166zOep6haIlauYFbrpljNueoqOA1P
X-Google-Smtp-Source: AGHT+IF5Rlqlzcasq3yQ7oB5dTj6ZV2govtfLRG0YgzrIMlAHQRNdXJsWBNANsgmaeP5Xw+q7rUY3g==
X-Received: by 2002:a05:620a:2193:b0:787:83a9:5aad with SMTP id g19-20020a05620a219300b0078783a95aadmr903051qka.0.1708483506701;
        Tue, 20 Feb 2024 18:45:06 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id wa23-20020a05620a4d1700b0078742e741cfsm3945398qkn.61.2024.02.20.18.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:45:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] linux-yocto/5.15: update to v5.15.145
Date: Tue, 20 Feb 2024 21:44:51 -0500
Message-Id: <20240221024500.3239062-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
References: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195941

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d93fa2c78854 Linux 5.15.145
    ee41f667aa64 kasan: disable kasan_non_canonical_hook() for HW tags
    f30f893143b9 tracing/kprobes: Return EADDRNOTAVAIL when func matches several symbols
    7aa33c99b513 Revert "drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers"
    4a8350a0ea76 Revert "drm/bridge: lt9611uxc: Register and attach our DSI device at probe"
    e21817ce167e Revert "drm/bridge: lt9611uxc: fix the race in the error path"
    811b5eaee70e ksmbd: don't update ->op_state as OPLOCK_STATE_NONE on error
    bd47f9c8b53b ksmbd: move setting SMB2_FLAGS_ASYNC_COMMAND and AsyncId
    5e1f31378a81 ksmbd: release interim response after sending status pending response
    c21d0445088d ksmbd: move oplock handling after unlock parent dir
    772d81aeecd3 ksmbd: separately allocate ci per dentry
    8ed1118da8c4 ksmbd: fix possible deadlock in smb2_open
    ae3356cbe9ac ksmbd: prevent memory leak on error return
    8dc9eb7d3503 ksmbd: handle malformed smb1 message
    1f50c418d47a ksmbd: fix kernel-doc comment of ksmbd_vfs_kern_path_locked()
    3fecda5d853c ksmbd: no need to wait for binded connection termination at logoff
    841bcade0964 ksmbd: add support for surrogate pair conversion
    0eaeb8aec49f ksmbd: fix missing RDMA-capable flag for IPoIB device in ksmbd_rdma_capable_netdev()
    20b4f6bd4cf9 ksmbd: fix recursive locking in vfs helpers
    f30a2ff71561 ksmbd: fix kernel-doc comment of ksmbd_vfs_setxattr()
    df79244f7339 ksmbd: reorganize ksmbd_iov_pin_rsp()
    845837fbfe79 ksmbd: Remove unused field in ksmbd_user struct
    fab0175b7f8e ksmbd: fix potential double free on smb2_read_pipe() error path
    ef435dec8a84 ksmbd: fix Null pointer dereferences in ksmbd_update_fstate()
    4b9b7ea1ffb1 ksmbd: fix wrong error response status by using set_smb2_rsp_status()
    dd45db4d9bbc ksmbd: fix race condition between tree conn lookup and disconnect
    0901be8dc6ea ksmbd: fix race condition from parallel smb2 lock requests
    50e13932ba55 ksmbd: fix race condition from parallel smb2 logoff requests
    f99d5d1d2a25 ksmbd: fix race condition with fp
    c77fd3e25a51 ksmbd: fix race condition between session lookup and expire
    b9a3e4549676 ksmbd: check iov vector index in ksmbd_conn_write()
    01df133b1a7d ksmbd: return invalid parameter error response if smb2 request is invalid
    4a67467f1134 ksmbd: fix passing freed memory 'aux_payload_buf'
    fbed0adfe507 ksmbd: remove unneeded mark_inode_dirty in set_info_sec()
    a9128c4134f1 ksmbd: remove experimental warning
    6997fa65bf9e ksmbd: add missing calling smb2_set_err_rsp() on error
    bd554ed4fdc3 ksmbd: fix slub overflow in ksmbd_decode_ntlmssp_auth_blob()
    7019440463df ksmbd: Fix one kernel-doc comment
    c5aa74449a41 ksmbd: reduce descriptor size if remaining bytes is less than request size
    e12b09241693 ksmbd: fix `force create mode' and `force directory mode'
    6f0207218c4c ksmbd: fix wrong interim response on compound
    f2283680a805 ksmbd: add support for read compound
    d7ad0ac5a8f6 ksmbd: switch to use kmemdup_nul() helper
    5c0df9d30c28 ksmbd: fix out of bounds in init_smb2_rsp_hdr()
    017d85c94f02 ksmbd: validate session id and tree id in compound request
    4a027b96515e ksmbd: check if a mount point is crossed during path lookup
    cf63b94fec60 ksmbd: Fix unsigned expression compared with zero
    5f36e22910c2 ksmbd: Replace one-element array with flexible-array member
    d9902ad14f82 ksmbd: Use struct_size() helper in ksmbd_negotiate_smb_dialect()
    97f5c1e3086c ksmbd: add missing compound request handing in some commands
    676392184785 ksmbd: fix out of bounds read in smb2_sess_setup
    d91ba80185e4 ksmbd: Replace the ternary conditional operator with min()
    2222ada0959b ksmbd: use kvzalloc instead of kvmalloc
    638043bef94a ksmbd: Change the return value of ksmbd_vfs_query_maximal_access to void
    7585898ddf5a ksmbd: return a literal instead of 'err' in ksmbd_vfs_kern_path_locked()
    4910a79a5f61 ksmbd: use kzalloc() instead of __GFP_ZERO
    b657622862ba ksmbd: remove unused ksmbd_tree_conn_share function
    ce95f7d2dcdf ksmbd: add mnt_want_write to ksmbd vfs functions
    0d1a3f97efbe ksmbd: validate smb request protocol id
    df3a4518aee6 ksmbd: check the validation of pdu_size in ksmbd_conn_handler_loop
    ae33f07c87ab ksmbd: fix posix_acls and acls dereferencing possible ERR_PTR()
    55ceeb4e1c71 ksmbd: fix out-of-bound read in parse_lease_state()
    4adb4fbd7481 ksmbd: fix out-of-bound read in deassemble_neg_contexts()
    049ed0f953da ksmbd: call putname after using the last component
    b423ddab6138 ksmbd: fix UAF issue from opinfo->conn
    19b2b9af315e ksmbd: fix multiple out-of-bounds read during context decoding
    61a306c1cc75 ksmbd: fix uninitialized pointer read in smb2_create_link()
    ea799dd27584 ksmbd: fix uninitialized pointer read in ksmbd_vfs_rename()
    b36295c17fb9 ksmbd: fix racy issue under cocurrent smb2 tree disconnect
    ae06b798f72d ksmbd: fix racy issue from smb2 close and logoff with multichannel
    dff87902d960 ksmbd: block asynchronous requests when making a delay on session setup
    a6a9601ba995 ksmbd: destroy expired sessions
    708c304b583d ksmbd: fix racy issue from session setup and logoff
    019aae488dbc ksmbd: fix racy issue from using ->d_parent and ->d_name
    b31e1ef30107 fs: introduce lock_rename_child() helper
    380a0fe8bd60 ksmbd: remove unused compression negotiate ctx packing
    0dbfcc34efab ksmbd: avoid duplicate negotiate ctx offset increments
    2ca23947df89 ksmbd: set NegotiateContextCount once instead of every inc
    39f5b4b313b4 ksmbd: avoid out of bounds access in decode_preauth_ctxt()
    921536046bd1 ksmbd: fix slab-out-of-bounds in init_smb2_rsp_hdr
    9494242c8e76 ksmbd: delete asynchronous work from list
    427caadf90e9 ksmbd: remove unused is_char_allowed function
    289b46fd11dd ksmbd: fix wrong signingkey creation when encryption is AES256
    bfe8372ef2db ksmbd: fix possible memory leak in smb2_lock()
    d625db885a10 ksmbd: Fix parameter name and comment mismatch
    0d3f06fd65fe ksmbd: Fix spelling mistake "excceed" -> "exceeded"
    1f1aca1d500d ksmbd: update Kconfig to note Kerberos support and fix indentation
    a35ebf658993 ksmbd: Remove duplicated codes
    b15734ec29b6 ksmbd: fix typo, syncronous->synchronous
    1f485b54d04a ksmbd: Implements sess->rpc_handle_list as xarray
    b1caecbf34b8 ksmbd: Implements sess->ksmbd_chann_list as xarray
    d7f088dc2794 ksmbd: send proper error response in smb2_tree_connect()
    bcab5c810544 ksmbd: Convert to use sysfs_emit()/sysfs_emit_at() APIs
    46c517bc0ac6 ksmbd: Fix resource leak in smb2_lock()
    9ea6b43d8a7d ksmbd: use F_SETLK when unlocking a file
    8263acd267f7 ksmbd: set SMB2_SESSION_FLAG_ENCRYPT_DATA when enforcing data encryption for this share
    64b4d72c596a ksmbd: replace one-element arrays with flexible-array members
    2bdd995f139c ksmbd: validate share name from share config response
    ef97ccd0fc64 ksmbd: call ib_drain_qp when disconnected
    b3e852bea8a7 ksmbd: make utf-8 file name comparison work in __caseless_lookup()
    131e308593e6 ksmbd: hide socket error message when ipv6 config is disable
    507cb106c3b9 ksmbd: reduce server smbdirect max send/receive segment sizes
    fe4d09792bc6 ksmbd: decrease the number of SMB3 smbdirect server SGEs
    d5a3b1024aab ksmbd: set NTLMSSP_NEGOTIATE_SEAL flag to challenge blob
    4d796ff8995a ksmbd: fix encryption failure issue for session logoff response
    e925de7defff ksmbd: fill sids in SMB_FIND_FILE_POSIX_INFO response
    95b72edca5d2 ksmbd: set file permission mode to match Samba server posix extension behavior
    813ef06ea2a3 ksmbd: change security id to the one samba used for posix extension
    62e6846ee3ba ksmbd: casefold utf-8 share names and fix ascii lowercase conversion
    43e2963be171 ksmbd: remove generic_fillattr use in smb2_open()
    aa77fc81825b ksmbd: constify struct path
    b79a9f991eb9 ksmbd: don't open-code %pD
    d6686d57919d ksmbd: don't open-code file_path()
    a7ddc4951f0f ksmbd: remove unnecessary generic_fillattr in smb2_open
    ebb8c616574a ksmbd: request update to stale share config
    c7aff8b8ffdb ksmbd: use wait_event instead of schedule_timeout()
    1f82ecbc7f1e ksmbd: remove unused ksmbd_share_configs_cleanup function
    8d0f823193f1 ksmbd: remove duplicate flag set in smb2_write
    d4b374ff2a3a ksmbd: smbd: Remove useless license text when SPDX-License-Identifier is already used
    ff403dbe43a1 ksmbd: smbd: relax the count of sges required
    9d609b52f952 ksmbd: smbd: fix connection dropped issue
    32af379e13df ksmbd: Fix some kernel-doc comments
    81602ee1c4fb ksmbd: fix wrong smbd max read/write size check
    918a690d8ab6 ksmbd: smbd: handle multiple Buffer descriptors
    673c186f8105 ksmbd: smbd: change the return value of get_sg_list
    30bd0df6e667 ksmbd: smbd: simplify tracking pending packets
    f17ed7b33899 ksmbd: smbd: introduce read/write credits for RDMA read/write
    982fcdec10ff ksmbd: smbd: change prototypes of RDMA read/write related functions
    6bb439930338 ksmbd: validate length in smb2_write()
    8e32e1584025 ksmbd: remove filename in ksmbd_file
    e9a325124611 smb3: fix ksmbd bigendian bug in oplock break, and move its struct to smbfs_common
    dc232946d108 ksmbd: replace usage of found with dedicated list iterator variable
    a5213868c62b ksmbd: Remove a redundant zeroing of memory
    7ee6f9ba9783 ksmbd: shorten experimental warning on loading the module
    a5a8c9133d97 ksmbd: store fids as opaque u64 integers
    170598b6f354 ksmbd: use netif_is_bridge_port
    c5049d2d73b2 ksmbd: add support for key exchange
    09b4c603831d ksmbd: smbd: validate buffer descriptor structures
    858b9644518f ksmbd: smbd: fix missing client's memory region invalidation
    51d0b879d6f5 ksmbd: add smb-direct shutdown
    d15077ad35af ksmbd: smbd: change the default maximum read/write, receive size
    ba7c3ff9053b ksmbd: smbd: create MR pool
    97b3a08892c0 ksmbd: smbd: call rdma_accept() under CM handler
    8a49ab3e59ed ksmbd: set 445 port to smbdirect port by default
    178ecc325728 ksmbd: register ksmbd ib client with ib_register_client()
    91d730756980 ksmbd: Fix smb2_get_name() kernel-doc comment
    dd56eb361f3a ksmbd: Delete an invalid argument description in smb2_populate_readdir_entry()
    36167446ce68 ksmbd: Fix smb2_set_info_file() kernel-doc comment
    2fa426c9d741 ksmbd: Fix buffer_check_err() kernel-doc comment
    e5b04973e720 ksmbd: set both ipv4 and ipv6 in FSCTL_QUERY_NETWORK_INTERFACE_INFO
    a63256708a99 ksmbd: Remove unused fields from ksmbd_file struct definition
    de203cdf1ee5 ksmbd: Remove unused parameter from smb2_get_name()
    82ae5fe3e629 ksmbd: use oid registry functions to decode OIDs
    7833bd31bc6b ksmbd: change LeaseKey data type to u8 array
    199b8b5ceba3 ksmbd: remove smb2_buf_length in smb2_transform_hdr
    e0c58420570c ksmbd: remove smb2_buf_length in smb2_hdr
    6cd90c01b032 ksmbd: remove md4 leftovers
    84af59bcab8e ksmbd: Remove redundant 'flush_workqueue()' calls
    a33bb607a1b2 ksmdb: use cmd helper variable in smb2_get_ksmbd_tcon()
    5fed9cbbafcb ksmbd: use ksmbd_req_buf_next() in ksmbd_verify_smb_message()
    1d146b1875fc Linux 5.15.144
    4c117984824b r8152: fix the autosuspend doesn't work
    aa3cc80e8eda r8152: remove rtl_vendor_mode function
    07ba21627ebb r8152: avoid to change cfg for all devices
    fa5f992dcf89 powerpc/ftrace: Fix stack teardown in ftrace_no_trace
    4624f5f298e2 powerpc/ftrace: Create a dummy stackframe to fix stack unwind
    410c05b60c1a RDMA/irdma: Prevent zero-length STAG registration
    93e765523b34 USB: gadget: core: adjust uevent timing on gadget unbind
    529f020f7b5f ring-buffer: Do not try to put back write_stamp
    b8d59ea20346 ring-buffer: Fix a race in rb_time_cmpxchg() for 32 bit archs
    fb63b1f99414 ring-buffer: Fix writing to the buffer with max_data_size
    e9587314fd1f ring-buffer: Have saved event hold the entire event
    8ed7d2800fa6 ring-buffer: Do not update before stamp when switching sub-buffers
    547937457fe2 tracing: Update snapshot buffer on resize if it is allocated
    97e70d6698f5 ring-buffer: Fix memory leak of free page
    f94942885e84 drm/amdgpu/sdma5.2: add begin/end_use ring callbacks
    8175dad2ad41 team: Fix use-after-free when an option instance allocation fails
    c2134ed53261 arm64: mm: Always make sw-dirty PTEs hw-dirty in pte_modify
    1bc91916e8ef ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS
    1a4da77ef61b soundwire: stream: fix NULL pointer dereference for multi_link
    5a95499843e8 btrfs: do not allow non subvolume root targets for snapshot
    7b427d8cb7a8 perf: Fix perf_event_validate_size() lockdep splat
    27714a22a1c2 HID: hid-asus: add const to read-only outgoing usb buffer
    11c17f42765a net: usb: qmi_wwan: claim interface 4 for ZTE MF290
    ca15561c99da asm-generic: qspinlock: fix queued_spin_value_unlocked() implementation
    0a3f27d9ad10 HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
    41759fab26b4 HID: hid-asus: reset the backlight brightness level on resume
    9f093e15faee HID: add ALWAYS_POLL quirk for Apple kb
    61fc877f7c34 HID: glorious: fix Glorious Model I HID report
    23b08531d8f3 platform/x86: intel_telemetry: Fix kernel doc descriptions
    7020385effce bcache: avoid NULL checking to c->root in run_cache_set()
    f891bbf13a94 bcache: add code comments for bch_btree_node_get() and __bch_btree_node_alloc()
    8758b0532f79 bcache: remove redundant assignment to variable cur_idx
    d38288af6f30 bcache: avoid oversize memory allocation by small stripe_size
    252c2a4795e9 blk-cgroup: bypass blkcg_deactivate_policy after destroying
    8146f7a8809b blk-throttle: fix lockdep warning of "cgroup_mutex or RCU read lock required!"
    b7d82e5dbe5a stmmac: dwmac-loongson: Add architecture dependency
    46412b2fb1f9 usb: aqc111: check packet for fixup for true limit
    fe13b6a6ddb1 drm/mediatek: Add spinlock for setting vblank event in atomic_begin
    6f709907ea90 PCI: loongson: Limit MRRS to 256
    4f4a9fc6b0cd Revert "PCI: acpiphp: Reassign resources on bridge if necessary"
    2d099b274e43 ALSA: hda/realtek: Apply mute LED quirk for HP15-db
    0239375ecb66 ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants
    d6df72b2f566 ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
    45f53ca3065b fuse: dax: set fc->dax to NULL in fuse_dax_conn_free()
    f21b7610d55f cred: switch to using atomic_long_t
    3a1428640259 net: atlantic: fix double free in ring reinit logic
    5b87ac25e8cf appletalk: Fix Use-After-Free in atalk_ioctl
    de73f41fd658 net: stmmac: Handle disabled MDIO busses from devicetree
    6f3b49a4158c net: stmmac: use dev_err_probe() for reporting mdio bus registration failure
    90715e0a4cbb dpaa2-switch: fix size of the dma_unmap
    444339f3aaff vsock/virtio: Fix unsigned integer wrap around in virtio_transport_has_space()
    a5ab70a9c547 sign-file: Fix incorrect return values check
    8eec2dcc4b83 stmmac: dwmac-loongson: Make sure MDIO is initialized before use
    abb40550adeb net: ena: Fix XDP redirection error
    5d45225702f3 net: ena: Fix xdp drops handling due to multibuf packets
    39082715bd8e net: ena: Destroy correct number of xdp queues upon failure
    e2b48f94802e net: Remove acked SYN flag from packet in the transmit queue correctly
    d3b174db0cd6 qed: Fix a potential use-after-free in qed_cxt_tables_alloc
    3f1f6a94d885 net/rose: Fix Use-After-Free in rose_ioctl
    3bb41dc361bf atm: Fix Use-After-Free in do_vcc_ioctl
    db400b1f8b6e octeontx2-af: Update RSS algorithm index
    e0676d37bb1a octeontx2-pf: Fix promisc mcam entry action
    86f50bb2a487 octeontx2-af: fix a use-after-free in rvu_nix_register_reporters
    af7a77216660 net: fec: correct queue selection
    3c4dcfbff15b net: vlan: introduce skb_vlan_eth_hdr()
    fe779dbb42fb atm: solos-pci: Fix potential deadlock on &tx_queue_lock
    e16f961f8bc5 atm: solos-pci: Fix potential deadlock on &cli_queue_lock
    d525bbd9dd2d qca_spi: Fix reset behavior
    4ec0e0e65bb6 qca_debug: Fix ethtool -G iface tx behavior
    173fc3212c31 qca_debug: Prevent crash on TX ring changes
    9846d8c8c383 net: ipv6: support reporting otherwise unknown prefix flags in RTM_NEWPREFIX
    77443956e635 HID: lenovo: Restrict detection of patched firmware only to USB cptkbd
    d37f44beef92 afs: Fix refcount underflow from error handling race
    a69d8ee03c88 ksmbd: fix memory leak in smb2_lock()
    fd0d9b167459 MIPS: Loongson64: Handle more memory types passed from firmware
    d9a9d8effdb2 memblock: allow to specify flags with memblock_add_node()
    49e0fcb522f3 mm/memory_hotplug: handle memblock_add_node() failures in add_memory_resource()
    5b77f41fb71c netfilter: nf_tables: fix 'exist' matching on bigendian arches
    3d4ad03bf1ee r8152: add vendor/device ID pair for ASUS USB-C2500
    404ce6ee69d3 r8152: add vendor/device ID pair for D-Link DUB-E250
    ca75274b17b8 r8152: add USB device driver for config selection
    f5494d96bcbe perf/x86/uncore: Don't WARN_ON_ONCE() for a broken discovery table
    d0fc081c6241 Linux 5.15.143
    2eba64dcbf26 devcoredump: Send uevent once devcd is ready
    97a9a7cf7f2f devcoredump : Serialize devcd_del work
    e5071ae7d829 smb: client: fix potential NULL deref in parse_dfs_referrals()
    d2bafe84dd7a cifs: Fix non-availability of dedup breaking generic/304
    c7a0a2651831 Revert "btrfs: add dmesg output for first mount and last unmount of a filesystem"
    1ed694fec589 MIPS: Loongson64: Enable DMA noncoherent support
    a71b6a615252 MIPS: Loongson64: Reserve vgabios memory on boot
    72bdf3445012 KVM: SVM: Update EFER software model on CR0 trap for SEV-ES
    15a8088786d1 KVM: s390/mm: Properly reset no-dat
    19e10526460a x86/CPU/AMD: Check vendor in the AMD microcode callback
    e5731380b753 serial: 8250_omap: Add earlycon support for the AM654 UART controller
    17c2ed9a99e4 serial: 8250: 8250_omap: Do not start RX DMA on THRI interrupt
    8718c0ab94e6 serial: 8250: 8250_omap: Clear UART_HAS_RHR_IT_DIS bit
    9bf8bc456f30 serial: sc16is7xx: address RX timeout interrupt errata
    87ac27041255 ARM: PL011: Fix DMA support
    9402252dda0c usb: typec: class: fix typec_altmode_put_partner to put plugs
    e24f2b219f39 Revert "xhci: Loosen RPM as default policy to cover for AMD xHC 1.1"
    742ecc1b1c2d parport: Add support for Brainboxes IX/UC/PX parallel cards
    86240d91ec40 usb: gadget: f_hid: fix report descriptor allocation
    f7a0cab502f5 drm/amdgpu: correct the amdgpu runtime dereference usage count
    091c77c287b4 drm/amd/amdgpu: Fix warnings in amdgpu/amdgpu_display.c
    324df6ecda16 gpiolib: sysfs: Fix error handling on failed export
    ebc7597ce971 perf: Fix perf_event_validate_size()
    00f8c6dc8274 perf/core: Add a new read format to get a number of lost samples
    4aed524081cf arm64: dts: mt8183: kukui: Fix underscores in node names
    1e64d6ddbd9f arm64: dts: mediatek: add missing space before {
    6276d125aa75 arm64: dts: mediatek: mt8183: Move thermal-zones to the root node
    a6b7222bbd3f arm64: dts: mediatek: align thermal zone node names with dtschema
    ab9ac2cb5740 tools headers UAPI: Sync linux/perf_event.h with the kernel sources
    dc52117cd797 docs/process/howto: Replace C89 with C11
    7aed508668ff platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch reporting
    e65128616faa netfilter: nft_set_pipapo: skip inactive elements during set walk
    bcedd497b3b4 io_uring/af_unix: disable sending io_uring over sockets
    c5a09d163184 mm: fix oops when filemap_map_pmd() without prealloc_pte
    c755e7cdacfe r8169: fix rtl8125b PAUSE frames blasting when suspended
    9234835fcc33 tracing: Stop current tracer when resizing buffer
    5a9cbf824225 tracing: Set actual size after ring buffer resize
    40a36f08a198 ring-buffer: Force absolute timestamp on discard of event
    0ccca12b7dd8 misc: mei: client.c: fix problem of return '-EOVERFLOW' in mei_cl_write
    271b563063e3 misc: mei: client.c: return negative error code in mei_cl_write
    4511b3650e53 coresight: etm4x: Remove bogous __exit annotation for some functions
    192352bd4bbe coresight: etm4x: Make etm4_remove_dev() return void
    318a206633c2 kallsyms: Make kallsyms_on_each_symbol generally available
    61b68b608954 binder: fix memory leaks of spam and pending work
    1665a875add8 arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
    dca1bfdb407e arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
    d052b5ade240 arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
    e37aa926447f arm64: dts: mediatek: mt7622: fix memory node warning check
    d849cf64c553 platform/surface: aggregator: fix recv_buf() return value
    d91fb1b7b799 regmap: fix bogus error on regcache_sync success
    d08a96e5ffdb packet: Move reference count in packet_sock to atomic_long_t
    c86b76896f6e tracing: Fix a possible race when disabling buffered events
    e733a6f84462 tracing: Fix incomplete locking when disabling buffered events
    fb0219bf9665 tracing: Disable snapshot buffer when stopping instance tracers
    9e41d92e2884 tracing: Always update snapshot buffer size
    ac3ccec33b92 checkstack: fix printed address
    762b0d529c95 nilfs2: prevent WARNING in nilfs_sufile_set_segment_usage()
    fd85766c7c3e nilfs2: fix missing error check for sb_set_blocksize call
    4bbf011bd6cc ALSA: hda/realtek: Enable headset on Lenovo M90 Gen5
    e5571507a1a4 ALSA: pcm: fix out-of-bounds in snd_pcm_state_names
    f82e39f75c23 ALSA: usb-audio: Add Pioneer DJM-450 mixer controls
    ea3291cb9075 io_uring: fix mutex_unlock with unreferenced ctx
    09f9d1fbaff9 nvme-pci: Add sleep quirk for Kingston drives
    7e765ec2f17c kprobes: consistent rcu api usage for kretprobe holder
    f5311389262d md: don't leave 'MD_RECOVERY_FROZEN' in error path of md_set_readonly()
    4a52acc91015 md: introduce md_ro_state
    940a7bcd4f77 riscv: fix misaligned access handling of C.SWSP and C.SDSP
    6e2f71188f23 ARM: dts: imx28-xea: Pass the 'model' property
    976eb1730717 ARM: dts: imx7: Declare timers compatible with fsl,imx6dl-gpt
    cb2034c02ffa ARM: imx: Check return value of devm_kasprintf in imx_mmdc_perf_init
    800aabe1eda1 scsi: be2iscsi: Fix a memleak in beiscsi_init_wrb_handle()
    48987eef55b8 tracing: Fix a warning when allocating buffered events fails
    6daed3710c1d ARM: dts: imx6ul-pico: Describe the Ethernet PHY clock
    2ea7438af1f0 arm64: dts: imx8mp: imx8mq: Add parkmode-disable-ss-quirk on DWC3
    8a21980df069 arm64: dts: imx8mq: drop usb3-resume-missing-cas from usb
    0511a9c56e58 RDMA/irdma: Avoid free the non-cqp_request scratch
    b7b24a7ffced RDMA/core: Fix umem iterator when PAGE_SIZE is greater then HCA pgsz
    9d2854cc2554 ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
    1d31ea4df805 hwmon: (nzxt-kraken2) Fix error handling path in kraken2_probe()
    9deab0c35ea4 hwmon: (acpi_power_meter) Fix 4.29 MW bug
    8ef49679a2f1 RDMA/bnxt_re: Correct module description string
    0b21a39bf1ad RDMA/rtrs-clt: Remove the warnings for req in_use check
    6cef8ca19140 RDMA/rtrs-clt: Fix the max_send_wr setting
    855b433468a4 RDMA/rtrs-srv: Destroy path files after making sure no IOs in-flight
    7df9d0d06475 RDMA/rtrs-srv: Free srv_mr iu only when always_invalidate is true
    00e54da50bf1 RDMA/rtrs-srv: Check return values while processing info request
    59cab0ae4873 RDMA/rtrs-clt: Start hb after path_up
    7f0460db1b88 RDMA/rtrs-srv: Do not unconditionally enable irq
    18556be80b2b arm64: dts: rockchip: Expand reg size of vdec node for RK3399
    583dec140d39 RDMA/irdma: Add wait for suspend on SQD
    f78b8b7f5bd5 RDMA/irdma: Do not modify to SQD on error
    754797722491 RDMA/hns: Fix unnecessary err return when using invalid congest control algorithm
    01c13d8a95e0 tee: optee: Fix supplicant based device enumeration
    d3d254e63ef4 drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group
    30d4881a757d net: add missing kdoc for struct genl_multicast_group::flags
    5299bca8c64f psample: Require 'CAP_NET_ADMIN' when joining "packets" group
    81b0c3d2824e bpf: sockmap, updating the sg structure should also update curr
    0d4e0afdd665 tcp: do not accept ACK of bytes we never sent
    38bae9cda82d netfilter: xt_owner: Fix for unsafe access of sk->sk_socket
    9de311e5d142 netfilter: nf_tables: validate family when identifying table via handle
    cf5f113c41eb netfilter: nf_tables: bail out on mismatching dynset and set expressions
    219c6b558414 octeontx2-af: Update Tx link register range
    4fe599a7cd7b net: hns: fix fake link up on xge port
    a5c2f9f7f882 ipv4: ip_gre: Avoid skb_pull() failure in ipgre_xmit()
    c8aca57e235d ionic: Fix dim work handling in split interrupt mode
    04022c185e45 ionic: fix snprintf format length warning
    246bc719ef0c net: bnxt: fix a potential use-after-free in bnxt_init_tc
    b14d6d404c22 i40e: Fix unexpected MFS warning message
    6113cba29f2f octeontx2-af: fix a use-after-free in rvu_npa_register_reporters
    e047a1fc12d3 net: stmmac: fix FPE events losing
    75c53a4c4329 arcnet: restoring support for multiple Sohard Arcnet cards
    789fed570205 platform/mellanox: Check devm_hwmon_device_register_with_groups() return value
    a24071448e9b platform/mellanox: Add null pointer checks for devm_kasprintf()
    45171e5eb7d5 mlxbf-bootctl: correctly identify secure boot with development keys
    401d9bab5108 r8152: Add RTL8152_INACCESSIBLE to r8153_aldps_en()
    5b9bf02f1c00 r8152: Add RTL8152_INACCESSIBLE to r8153_pre_firmware_1()
    0a53ed0b0068 r8152: Add RTL8152_INACCESSIBLE to r8156b_wait_loading_flash()
    a637801347e8 r8152: Add RTL8152_INACCESSIBLE checks to more loops
    00beca907a7b r8152: Rename RTL8152_UNPLUG to RTL8152_INACCESSIBLE
    89c619b1b656 hv_netvsc: rndis_filter needs to select NLS
    f258a0bed308 octeontx2-af: Check return value of nix_get_nixlf before using nixlf
    51e7868e5df9 octeontx2-pf: Add missing mutex lock in otx2_get_pauseparam
    a239affd93d3 ipv6: fix potential NULL deref in fib6_add()
    9008af83efa3 platform/x86: wmi: Skip blocks with zero instances
    29783a17a30a platform/x86: wmi: Allow duplicate GUIDs for drivers that use struct wmi_driver
    0f06d9bd2ef8 of: dynamic: Fix of_reconfig_get_state_change() return value documentation
    5dd9a481da29 platform/x86: asus-wmi: Move i8042 filter install to shared asus-wmi code
    450f8c95a5cb platform/x86: asus-wmi: Simplify tablet-mode-switch handling
    f277c14b6d5f platform/x86: asus-wmi: Simplify tablet-mode-switch probing
    36ede1474698 platform/x86: asus-wmi: Add support for ROG X13 tablet mode
    e8aed5133f6a platform/x86: asus-wmi: Adjust tablet/lidflip handling to use enum
    bfac5cc5a6da drm/amdgpu: correct chunk_ptr to a pointer to chunk.
    94e5ed1620f4 kconfig: fix memory leak from range properties
    c5ab980acfc0 tg3: Increment tx_dropped in tg3_tso_bug()
    d188dcb9db40 tg3: Move the [rt]x_dropped counters to tg3_napi
    8bb930c3a1ea netfilter: ipset: fix race condition between swap/destroy and kernel side add/del/test
    89a057818db3 i2c: designware: Fix corrupted memory seen in the ISR
    6fcbcc6c8e52 hrtimers: Push pending hrtimers away from outgoing CPU earlier
    ef93d8853129 vdpa/mlx5: preserve CVQ vringh index

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 37fb729e0d..4f02e5acfa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "205938506aafa86698f2753a59d2c9f13d080fbb"
-SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
+SRCREV_machine ?= "cf2f74df4ffdee7034979616bc37c5717b0d6070"
+SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.142"
+LINUX_VERSION ?= "5.15.145"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f502030c9d..037c33f434 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.142"
+LINUX_VERSION ?= "5.15.145"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "53b8058476d634a0103dff993e24d15b1fd087c7"
-SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
+SRCREV_machine ?= "3b30ca7fb1716cd0f7bbf16c1253d8a4bbdeb421"
+SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1021065bf7..0cb559b162 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "325679bc1a595ca81783f7652e13ce7f2be58620"
-SRCREV_machine:qemuarm64 ?= "338f086bcd841a5b0239ddb66c34ca23ff5af2f5"
-SRCREV_machine:qemumips ?= "af26192f4dd0fc7396faedd4653034ae02d5ed6d"
-SRCREV_machine:qemuppc ?= "be567407d4d9009407c4e7a511e7227fcb36b0b7"
-SRCREV_machine:qemuriscv64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemuriscv32 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemux86 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemux86-64 ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_machine:qemumips64 ?= "3a2ff5c2f2e6e0c0653da1192081681e2a50b592"
-SRCREV_machine ?= "97015a8737f3f284f9a9c4967bf12c8b26efcdcc"
-SRCREV_meta ?= "9a1e0301f56cda16a9fabd03745dba445f068349"
+SRCREV_machine:qemuarm ?= "5b261b61614c090b787fdadb865c5db3ee0171f4"
+SRCREV_machine:qemuarm64 ?= "fdaf870c63fc887b40138cca652ae961c9556a95"
+SRCREV_machine:qemumips ?= "8a07b5a788879035d1eea4df0780a40d131cf5d9"
+SRCREV_machine:qemuppc ?= "fffda6901d92bf63f7876cb6d912492030995588"
+SRCREV_machine:qemuriscv64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemuriscv32 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemux86 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemux86-64 ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_machine:qemumips64 ?= "510f5a0a3daaf9f970b610a427f77c52289a2777"
+SRCREV_machine ?= "dd7a3940edb28ce99789430818b521c38dec4c6f"
+SRCREV_meta ?= "d3ba5beca1136447584b7af10546fff974c36cc1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8a1d809b05454b2e08fb3d801787917975fdb037"
+SRCREV_machine:class-devupstream ?= "d93fa2c78854d25ed4b67ac87f1c3c264d8b27fb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.142"
+LINUX_VERSION ?= "5.15.145"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


